class LabFarsController < ApplicationController
  before_action :set_lab_far, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion

  # GET /lab_fars
  # GET /lab_fars.json
  def index
    @pago = Pago.new
    id =  session[:farmacia_id]
    @cant_lab =  Farmacium.find_by_sql("select cant_lab from farmacia where id = #{id} ").first
    sql = "Select * from laboratorios where not exists (select * from lab_fars where lab_fars.laboratorio_id = laboratorios.id and lab_fars.farmacium_id = #{id} ) and laboratorios.activo = true order by nombre"
    @laboratorios =  Laboratorio.paginate_by_sql(sql, :page => params[:page], :per_page => 5)
  end
  # Busqueda de laboratorios en farmacia
  def busqueda
    @pago = Pago.new
    nombre = params[:laboratorio_id]
    id =  session[:farmacia_id]
    @cant_lab =  Farmacium.find_by_sql("select cant_lab from farmacia where id = #{id} ").first
    sql = "Select * from laboratorios where not exists (select * from lab_fars where lab_fars.laboratorio_id = laboratorios.id and lab_fars.farmacium_id = #{id} ) and laboratorios.activo = true and  LOWER(laboratorios.nombre) like LOWER('%#{nombre}%') order by nombre"
    @laboratorios =  Laboratorio.paginate_by_sql(sql, :page => params[:page], :per_page => 5)
    render :template => "lab_fars/index"
  end
   # Busqueda de laboratorios farmacia agregados
  def busquedaLaboratoriosAgregados
    nombre = params[:laboratorio_id]
    id =  session[:farmacia_id]
    sql = "Select laboratorios.nombre, laboratorios.descripcion, laboratorios.id, lab_fars.activo from lab_fars, laboratorios where lab_fars.farmacium_id = #{id} and lab_fars.laboratorio_id = laboratorios.id and  LOWER(laboratorios.nombre) like LOWER('%#{nombre}%') order by nombre"
    @laboratorios =  Laboratorio.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "lab_fars/laboratoriosfarmacia"
  end
  # GET /lab_fars
  # laboratorios farmacia agregados
  def lab_farm
    id =  session[:farmacia_id]
    sql = "Select laboratorios.nombre, laboratorios.descripcion, laboratorios.id, lab_fars.activo from lab_fars, laboratorios where lab_fars.farmacium_id = #{id} and lab_fars.laboratorio_id = laboratorios.id order by nombre"
    @laboratorios =  Laboratorio.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "lab_fars/laboratoriosfarmacia"
  end
  # vista de productos anadir la farmacia
    def labAddProduct
    @productos = Producto.all
    render :template => "lab_fars/productoadd"
  end

  # GET /lab_fars/1
  #Metodo usado para a;adir laboratorio a farmacia
  def show

    farmacia_id =  session[:farmacia_id]
    laboratorio_id = params[:id]
    activo = true 
    farmaciaCant = Farmacium.find_by_sql("select cant_lab from farmacia where id = #{farmacia_id} ").first
   
    respond_to do |format|
      if farmaciaCant.cant_lab ==0
       format.html { redirect_to "/lab_fars", notice: 'Debes de pagar para obtener más laboratorios' }
    else
       
    @lab_far = LabFar.new(farmacium_id: farmacia_id, laboratorio_id: laboratorio_id, activo: activo)
      if @lab_far.save
       
         cant = farmaciaCant.cant_lab - 1 
         Farmacium.where(id:farmacia_id).update_all(cant_lab: cant )
        format.html { redirect_to "/lab_fars", notice: 'Laboratorio agregado con éxito.' }
      else
        
        format.json { render json: @lab_far.errors, status: :unprocessable_entity }
      end
    end
   end   
  end

  # GET /lab_fars/new
  def new
    @lab_far = LabFar.new
  end

  # GET /lab_fars/1/edit
  def edit
  end



  # PATCH/PUT /lab_fars/1
  # PATCH/PUT /lab_fars/1.json
  def update
    respond_to do |format|
       activo = params[:lab_far][:activo]
       farmacia_id = session[:farmacia_id]
        id = params[:id]
        LabFar.where(laboratorio_id: id, farmacium_id:farmacia_id).update_all(activo: activo )
       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_far
      @lab_far = Laboratorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_far_params
      params.require(:lab_far).permit(:farmacia_id, :laboratorio_id, :activo)
    end
end
