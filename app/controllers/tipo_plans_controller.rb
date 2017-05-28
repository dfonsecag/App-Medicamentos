class TipoPlansController < ApplicationController
  before_action :set_tipo_plan, only: [:show, :edit, :update, :destroy]

  # GET /tipo_plans
  # GET /tipo_plans.json
  def index
    @tipo_plans = TipoPlan.all
  end

  # GET /tipo_plans/1
  # GET /tipo_plans/1.json
  def show
  end

  # GET /tipo_plans/new
  def new
    @tipo_plan = TipoPlan.new
  end

  # GET /tipo_plans/1/edit
  def edit
  end

  # POST /tipo_plans
  # POST /tipo_plans.json
  def create
    @tipo_plan = TipoPlan.new(tipo_plan_params)

    respond_to do |format|
      if @tipo_plan.save
        id=params[:tipo_plan][:plan_paciente_id]
       format.html { redirect_to "/plan_pacientes/#{id}", notice: 'Descripcion plan creado con éxito.' }
      else
        format.html { render :new }
        format.json { render json: @tipo_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_plans/1
  # PATCH/PUT /tipo_plans/1.json
  def update
    respond_to do |format|
      if @tipo_plan.update(tipo_plan_params)
        format.html { redirect_to @tipo_plan, notice: 'Tipo plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_plan }
      else
        format.html { render :edit }
        format.json { render json: @tipo_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_plans/1
  # DELETE /tipo_plans/1.json
  def destroy
    @tipo_plan.destroy
    respond_to do |format|
       msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_plan
      @tipo_plan = TipoPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_plan_params
      params.require(:tipo_plan).permit(:tipo, :descripcion, :plan_paciente_id)
    end
end
