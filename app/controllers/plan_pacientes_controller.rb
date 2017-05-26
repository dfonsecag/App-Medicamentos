class PlanPacientesController < ApplicationController
  before_action :set_plan_paciente, only: [:show, :edit, :update, :destroy]

  # GET /plan_pacientes
  # GET /plan_pacientes.json
  def index
    @plan_pacientes = PlanPaciente.all
  end

  # GET /plan_pacientes/1
  # GET /plan_pacientes/1.json
  def show
  end

  # GET /plan_pacientes/new
  def new
    @laboratorios = Laboratorio.all
    @plan_paciente = PlanPaciente.new
  end

  # GET /plan_pacientes/1/edit
  def edit
  end

  # POST /plan_pacientes
  # POST /plan_pacientes.json
  def create
    @plan_paciente = PlanPaciente.new(plan_paciente_params)

    respond_to do |format|
      if @plan_paciente.save
        format.html { redirect_to @plan_paciente, notice: 'Plan paciente was successfully created.' }
        format.json { render :show, status: :created, location: @plan_paciente }
      else
        format.html { render :new }
        format.json { render json: @plan_paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_pacientes/1
  # PATCH/PUT /plan_pacientes/1.json
  def update
    respond_to do |format|
      if @plan_paciente.update(plan_paciente_params)
        format.html { redirect_to @plan_paciente, notice: 'Plan paciente was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan_paciente }
      else
        format.html { render :edit }
        format.json { render json: @plan_paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_pacientes/1
  # DELETE /plan_pacientes/1.json
  def destroy
    @plan_paciente.destroy
    respond_to do |format|
      format.html { redirect_to plan_pacientes_url, notice: 'Plan paciente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_paciente
      @plan_paciente = PlanPaciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_paciente_params
      params.require(:plan_paciente).permit(:nombre, :laboratorio_id)
    end
end
