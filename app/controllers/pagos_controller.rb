class PagosController < ApplicationController
  before_action :set_pago, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion
  before_action :verificarUsuario, only: [:update, :destroy, :index]
    require 'sendgrid-ruby'
  include SendGrid
  

  # GET /pagos
  # GET /pagos.json
  def index

    sql = "select pagos.id, pagos.numcomprobante, pagos.verificado,pagos.farmacium_id, farmacia.nombre from pagos, farmacia where pagos.farmacium_id = farmacia.id"
    @pagos =  Pago.paginate_by_sql(sql, :page => params[:page], :per_page => 9)
  end
  def busqueda
    nombre = params[:nombre]
      
   sql = "select pagos.id, pagos.numcomprobante, pagos.verificado,pagos.farmacium_id, farmacia.nombre from  pagos, farmacia where pagos.farmacium_id = farmacia.id and LOWER(farmacia.nombre) like LOWER('%#{nombre}%')"
    @pagos =  Pago.paginate_by_sql(sql, :page => params[:page], :per_page => 9)
    render :template => "pagos/index"
  end


  # GET /pagos/1
  # GET /pagos/1.json
  def show
  end

  # GET /pagos/new
  def new
    @pago = Pago.new
  end

  # GET /pagos/1/edit
  def edit
  end

  # POST /pagos
  # POST /pagos.json
  def create

    @pago = Pago.new(pago_params)

    @pago.farmacium_id = session[:farmacia_id]
    @pago.numcomprobante = params[:pago][:numcomprobante]


    respond_to do |format|
      if (params[:pago][:numcomprobante].length >=  11)
      format.html { redirect_to "/lab_fars", notice: 'Comprobante no puede tener mas de 11 carácteres.' }
      else
      if @pago.save
         format.html { redirect_to "/lab_fars", notice: 'Comprobante se envió satisfactoriamente.' }
      else
        format.html { redirect_to "/lab_fars", notice: 'Reporte de pago no debe estar en blanco.' }
        
        end
      end
    end
  end

  # PATCH/PUT /pagos/1
  # PATCH/PUT /pagos/1.json
  def update
     respond_to do |format|
       idfarmacia = params[:idfarmacia]
        id = params[:id]
        
        Pago.where(id: id).update_all(verificado: true )
        farmacia =  Farmacium.find_by_sql("select nombre, correo, cant_lab from farmacia where id = #{idfarmacia} ").first
        
         cant = farmacia.cant_lab + 1 
         Farmacium.where(id:idfarmacia).update_all(cant_lab: cant )
         # notificar a la farmacia por correo
    from = Email.new(email: 'diegogarciafonseca@gmail.com')
    to = Email.new(email: "#{farmacia.correo}")
    subject = 'Verificación de pago laboratorios'
    content = Content.new(type: 'text/plain', value: "Estimada Farmacia: #{farmacia.nombre}, su compobante número #{id}, sea verificado con éxito.")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers

       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    @pago.destroy
    respond_to do |format|
      format.html { redirect_to pagos_url, notice: 'Pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_params
      params.require(:pago).permit(:farmacia_id, :numcomprobante, :verificado)
    end
end
