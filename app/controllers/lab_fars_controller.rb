class LabFarsController < ApplicationController
  before_action :set_lab_far, only: [:show, :edit, :update, :destroy]

  # GET /lab_fars
  # GET /lab_fars.json
  def index
    # @laboratorios = Laboratorio.all
    @laboratorios = 
Laboratorio.find_by_sql("Select * from laboratorios where not exists (select 1 from lab_fars where lab_fars.laboratorio_id = laboratorios.id)")
  end
  # GET /lab_fars
  # laboratorios farmacia agregados
  def lab_farm
    @laboratorios = LabFar.all
    render :template => "lab_fars/laboratoriosfarmacia"
  end
  # vista de productos anadir la farmacia
    def labAddProduct
    @laboratorios = LabFar.all
    render :template => "lab_fars/productoadd"
  end

  # GET /lab_fars/1
  # GET /lab_fars/1.json
  def show

    @farmacia_id =  session[:farmacia_id]
    @laboratorio_id = params[:id]
    @activo = true
      @lab_far = LabFar.new(farmacium_id: @farmacia_id, laboratorio_id: @laboratorio_id, activo: @activo)

    respond_to do |format|
      if @lab_far.save
        format.html { redirect_to "/lab_fars", notice: 'Laboratorio agregado con éxito.' }
      else
        
        format.json { render json: @lab_far.errors, status: :unprocessable_entity }
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
      if @lab_far.update(lab_far_params)
        format.html { redirect_to @lab_far, notice: 'Lab far was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab_far }
      else
        format.html { render :edit }
        format.json { render json: @lab_far.errors, status: :unprocessable_entity }
      end
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
