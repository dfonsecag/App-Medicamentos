class LaboratoriosController < ApplicationController
  before_action :set_laboratorio, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion
  before_action :verificarUsuario
  # GET /laboratorios
  # GET /laboratorios.json
  def index
     @laboratorios = Laboratorio.all
      # render json: @laboratorios
      
    @laboratorios = Laboratorio.paginate(:page => params[:page], :per_page => 8)
  end
   def busqueda
    nombre = params[:nombre]
      
   sql = "select * from laboratorios where LOWER(nombre) like LOWER('%#{nombre}%')"
    @laboratorios =  Laboratorio.paginate_by_sql(sql, :page => params[:page], :per_page => 8)
    render :template => "laboratorios/index"
  end

  # GET /laboratorios/1
  # GET /laboratorios/1.json
  def show
  end

  # GET /laboratorios/new
  def new
    @laboratorio = Laboratorio.new
  end

  # GET /laboratorios/1/edit
  def edit
  end

  # POST /laboratorios
  # POST /laboratorios.json
  def create
    @laboratorio = Laboratorio.new(laboratorio_params)

    respond_to do |format|
      if @laboratorio.save
        format.html { redirect_to "/laboratorios/new", notice: 'Laboratorio creado con éxito.' }
      else
        format.html { render :new }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratorios/1
  # PATCH/PUT /laboratorios/1.json
  def update
    respond_to do |format|
      if @laboratorio.update(laboratorio_params)
        format.html { redirect_to "/laboratorios", notice: 'Laboratorio actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @laboratorio }
      else
        format.html { render :edit }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end
  # Metodo para actualizar activo de laboratorio
  def activo_update
      respond_to do |format|
       activo = params[:laboratorio][:activo]
        id = params[:id]
        Laboratorio.where(id: id).update_all(activo: activo )
       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end

  # DELETE /laboratorios/1
  # DELETE /laboratorios/1.json
  def destroy
   
    @laboratorio.destroy
    respond_to do |format|
      msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratorio
      @laboratorio = Laboratorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laboratorio_params
      params.require(:laboratorio).permit(:nombre, :descripcion)
    end
end
