class FarmaciaController < ApplicationController
  before_action :set_farmacium, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion, except:[:new, :create, :creado]
  before_action :verificarUsuario, only: [:index, :update_verificado, :destroy , :farmacias_verificadas, :busqueda,:busquedaVerificadas, :update_verificado]
  require 'sendgrid-ruby'
  include SendGrid

  # GET /farmacia
  # GET /farmacia.json
  def index
     @farmacia = Farmacium.paginate(:page => params[:page], :per_page => 7)
     sql = 'SELECT id, nombre,"cedulaJur", sucursal, direccion, telefono1, correo, verificado from Farmacia where verificado = false order by nombre'
    @farmacia =  Farmacium.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
  end
 # para las farmacias verificadas
  def farmacias_verificadas
    @farmacia = Farmacium.paginate(:page => params[:page], :per_page => 7)
     sql = 'SELECT id, nombre,"cedulaJur", sucursal, direccion,cant_lab, telefono1, telefono2, correo, cant_lab from Farmacia where verificado = true order by nombre'
    @farmacia =  Farmacium.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "farmacia/verificada"
  end
  def busqueda
    nombre = params[:nombre]      
    sql = "SELECT * from Farmacia where verificado = false and LOWER(nombre) like LOWER('%#{nombre}%') order by nombre"
    @farmacia =  Farmacium.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "farmacia/index"
  end
  def busquedaVerificadas
    nombre = params[:nombre]      
   sql = "SELECT * from Farmacia where verificado = true and LOWER(nombre) like LOWER('%#{nombre}%') order by nombre"
    @farmacia =  Farmacium.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "farmacia/verificada"
  end

  # GET /farmacia/1
  # GET /farmacia/1.json
  def show
  end

  # GET /farmacia/new
  def new
    @farmacium = Farmacium.new
  end

  # GET /farmacia/1/edit
  def edit
  end

  # POST /farmacia
  # POST /farmacia.json
  def create
    @farmacium = Farmacium.new(farmacium_params)

    respond_to do |format|
      if @farmacium.save
        # notificar a la farmacia por correo
         from = Email.new(email: 'diegogarciafonseca@gmail.com')
          to = Email.new(email: "#{@farmacium.correo}")
          subject = 'Bienvenida a la aplicación App Medicamentos'
          content = Content.new(type: 'text/plain', value: "Bienvenida Farmacia: #{@farmacium.nombre}. Pronto le notificaremos al correo #{@farmacium.correo},
           que el registro de su farmacia fue verificada exitosamente .")
          mail = Mail.new(from, subject, to, content)

          sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
          response = sg.client.mail._('send').post(request_body: mail.to_json)
          puts response.status_code
          puts response.body
          puts response.headers
        format.html { redirect_to "/login", notice: 'Farmacia creada con éxito. Pronto se le enviaremos un correo que su farmacia ha sido verificada exitosamente.' }
       
      else
        format.html { render :new }
        format.json { render json: @farmacium.errors, status: :unprocessable_entity }
      end
    end
  end
  def creado
    render :template => "farmacia/creado"
  end

  # PATCH/PUT /farmacia/1
  # PATCH/PUT /farmacia/1.json
   def update
    respond_to do |format|
      if @farmacium.update(farmacium_params)
        format.html { redirect_to "/lab_fars", notice: 'Farmacia actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @laboratorio }
      else
        format.html { render :edit }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /farmacia/1
  # PATCH/PUT /farmacia/1.json
  def update_verificado
    respond_to do |format|
        activo = params[:farmacium][:activo]
        id = params[:id]
        Farmacium.where(id:id).update_all(verificado: activo )
         @farmacium = Farmacium.find(params[:id])
         # Envio de correo electronico de confirmacion de verificacion farmacia
         from = Email.new(email: 'diegogarciafonseca@gmail.com')
          to = Email.new(email: "#{@farmacium.correo}")
          subject = 'Bienvenida a la aplicación App Medicamentos'
          content = Content.new(type: 'text/plain', value: "Bienvenida Farmacia: #{@farmacium.nombre}. Pronto le notificaremos al correo #{@farmacium.correo},
           que el registro de su farmacia fue verificada exitosamente .")
          mail = Mail.new(from, subject, to, content)

          sg = SendGrid::API.new(api_key: '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')
          response = sg.client.mail._('send').post(request_body: mail.to_json)
          puts response.status_code
          puts response.body
          puts response.headers

       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end
 
  # DELETE /farmacia/1
  # DELETE /farmacia/1.json
  def destroy
    @farmacium.destroy
    respond_to do |format|
      msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmacium
       @farmacium = Farmacium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmacium_params
      params.require(:farmacium).permit(:nombre, :cedulaJur, :sucursal, :direccion, :correo, :telefono1, :telefono2, :latitud, :longitud, :cant_lab, :activo, :photo, :password)
    end
end
