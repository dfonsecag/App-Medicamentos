class FarmaciaController < ApplicationController
  before_action :set_farmacium, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion, except:[:new, :create]
  before_action :verificarUsuario, only: [:index, :update_verificado ]
  

  # GET /farmacia
  # GET /farmacia.json
  def index
     @farmacia = Farmacium.paginate(:page => params[:page], :per_page => 8)
     sql = 'SELECT id, nombre,"cedulaJur", sucursal, direccion, telefono1, correo, verificado from Farmacia where verificado = false'
    @farmacia =  Farmacium.paginate_by_sql(sql, :page => params[:page], :per_page => 8)
  end
 # para las farmacias verificadas
  def farmacias_verificadas
    @farmacia = Farmacium.paginate(:page => params[:page], :per_page => 8)
     sql = 'SELECT id, nombre,"cedulaJur", sucursal, direccion,cant_lab, telefono1, telefono2, correo, cant_lab from Farmacia where verificado = true'
    @farmacia =  Farmacium.paginate_by_sql(sql, :page => params[:page], :per_page => 8)
    render :template => "farmacia/verificada"
  end
  def busqueda
    nombre = params[:nombre]      
   sql = "SELECT * from Farmacia where verificado = true and LOWER(nombre) like LOWER('%#{nombre}%')"
    @farmacia =  Farmacium.paginate_by_sql(sql, :page => params[:page], :per_page => 8)
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
        # UserNotifier.send_signup_email(@farmacium).deliver
        format.html { redirect_to "/farmacia/new", notice: 'Farmacia creada con éxito.' }
       
      else
        format.html { render :new }
        format.json { render json: @farmacium.errors, status: :unprocessable_entity }
      end
    end
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
        # FarmaciaVerificator.send_email(@farmacium).deliver

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
