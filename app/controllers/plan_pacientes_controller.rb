class PlanPacientesController < ApplicationController
  before_action :set_plan_paciente, only: [:show, :edit, :update, :destroy]
   before_action :autenticacion
   before_action :verificarUsuario, except: [:farmacia_plan_paciente]
  # GET /laboratorios
  # GET /plan_pacientes
  # GET /plan_pacientes.json
  def index
    @plan_pacientes = PlanPaciente.paginate(:page => params[:page], :per_page => 7)
  end
   def busqueda
    nombre = params[:nombre]      
   sql = "select * from plan_pacientes where LOWER(nombre) like LOWER('%#{nombre}%')"
    @plan_pacientes=  PlanPaciente.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "plan_pacientes/index"
  end

  # GET /plan_pacientes/1
  # GET /plan_pacientes/1.json
  def show
       @tipo_plan = TipoPlan.new
       @plan_Paciente_Paciente = TipoPlan.where(["plan_paciente_id = ? and tipo = ?", params[:id], "Paciente"])
       @plan_Paciente_Farmacia = TipoPlan.where(["plan_paciente_id = ? and tipo = ?", params[:id], "Farmacia"])
  end
   # GET /plan_pacientes_farmacia/1
  # Metodo para que la farmacia vea la lista de los requisitos del plan
  def farmacia_plan_paciente
     @plan_Paciente =  PlanPaciente.find(params[:id])
      @plan_Paciente_Farmacia = TipoPlan.where(["plan_paciente_id = ? and tipo = ?", params[:id], "Farmacia"])
      render :template => "plan_pacientes/farmacia_planpaciente"
  end

  # GET /plan_pacientes/new
  def new    
    @laboratorios =  Laboratorio.find_by_sql("Select id, nombre from laboratorios where  not exists (select * from plan_pacientes where plan_pacientes.laboratorio_id = laboratorios.id )")    
    @plan_paciente = PlanPaciente.new
  end

  # GET /plan_pacientes/1/edit
  def edit
    id =  PlanPaciente.where(["id = ? ", params[:id]]).first
    id = id.laboratorio_id
    @laboratorios =  Laboratorio.find_by_sql("Select id, nombre from laboratorios where not exists (select * from plan_pacientes where plan_pacientes.laboratorio_id = laboratorios.id and laboratorios.id <> #{id} )  ")
  end

  # POST /plan_pacientes
  # POST /plan_pacientes.json
  def create
    @plan_paciente = PlanPaciente.new(plan_paciente_params)

    respond_to do |format|
      if @plan_paciente.save
        format.html { redirect_to "/plan_pacientes/new", notice: 'Plan Paciente creado con éxito.' }
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
        format.html { redirect_to "/plan_pacientes", notice: 'Plan Paciente actualizado con éxito.' }
        
      else
        format.html { render :edit }
        format.json { render json: @plan_paciente.errors, status: :unprocessable_entity }
      end
    end
  end
  # Metodo para actualizar activo de Plan Paciente
  def activo_update
      respond_to do |format|
       activo = params[:plan_paciente][:activo]
        id = params[:id]
        PlanPaciente.where(id: id).update_all(activo: activo )
       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end

  # DELETE /plan_pacientes/1
  # DELETE /plan_pacientes/1.json
  def destroy
    @plan_paciente.destroy
    respond_to do |format|
      msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
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
