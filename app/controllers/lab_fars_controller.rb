class LabFarsController < ApplicationController
  before_action :set_lab_far, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion

  # GET /lab_fars
  # GET /lab_fars.json
  def index
    id =  session[:farmacia_id]
    @cant_lab =  Farmacium.find_by_sql("select cant_lab from farmacia where id = #{id} ").first
    sql = "Select * from laboratorios where not exists (select * from lab_fars where lab_fars.laboratorio_id = laboratorios.id and lab_fars.farmacium_id = #{id} )"
    @laboratorios =  Laboratorio.paginate_by_sql(sql, :page => params[:page], :per_page => 8)

  end
  # GET /lab_fars
  # laboratorios farmacia agregados
  def lab_farm
    @laboratorios = LabFar.where(["farmacium_id = ? ",session[:farmacia_id]]).paginate(:page => params[:page], :per_page => 8)
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
    farmaciaCant = Farmacium.where(id: farmacia_id).first
   
    respond_to do |format|
      if farmaciaCant.cant_lab ==0
       format.html { redirect_to "/lab_fars", notice: 'Laboratorio cantidad maxima' }
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

  # POST /lab_fars
  # POST /lab_fars.json
  def create
    @lab_far = LabFar.new(lab_far_params)

    respond_to do |format|
      if @lab_far.save
        format.html { redirect_to @lab_far, notice: 'Lab far was successfully created.' }
        format.json { render :show, status: :created, location: @lab_far }
      else
        format.html { render :new }
        format.json { render json: @lab_far.errors, status: :unprocessable_entity }
      end
    end
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

  # DELETE /lab_fars/1
  # DELETE /lab_fars/1.json
  def destroy
    @lab_far.destroy
    respond_to do |format|
      format.html { redirect_to lab_fars_url, notice: 'Lab far was successfully destroyed.' }
      format.json { head :no_content }
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
