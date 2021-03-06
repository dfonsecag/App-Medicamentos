class PresentacionsController < ApplicationController
  before_action :set_presentacion, only: [:show, :edit, :update, :destroy]
   before_action :autenticacion
   before_action :verificarUsuario
  # GET /laboratorios

  # GET /presentacions
  # GET /presentacions.json
  def index
    sql = "select * from presentacions order by descripcion"
    @presentacions =  Presentacion.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
  end
   def busqueda
    nombre = params[:nombre]
      
   sql = "select * from presentacions where LOWER(descripcion) like LOWER('%#{nombre}%') order by descripcion"
    @presentacions =  Presentacion.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "presentacions/index"
  end

  # GET /presentacions/1
  # GET /presentacions/1.json
  def show
  end

  # GET /presentacions/new
  def new
    @presentacion = Presentacion.new
  end

  # GET /presentacions/1/edit
  def edit
  end

  # POST /presentacions
  # POST /presentacions.json
  def create
    @presentacion = Presentacion.new(presentacion_params)

    respond_to do |format|
      if @presentacion.save
       format.html { redirect_to "/presentacions/new", notice: 'Presentación creada con éxito.' }
      else
        format.html { render :new }
        format.json { render json: @presentacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentacions/1
  # PATCH/PUT /presentacions/1.json
  def update
    respond_to do |format|
      if @presentacion.update(presentacion_params)
        format.html { redirect_to "/presentacions", notice: 'Presentación actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @presentacion }
      else
        format.html { render :edit }
        format.json { render json: @presentacion.errors, status: :unprocessable_entity }
      end
    end
  end
  # Metodo para actualizar activo de Presentacion
  def activo_update
      respond_to do |format|
       activo = params[:presentacion][:activo]
        id = params[:id]
        Presentacion.where(id: id).update_all(activo: activo )
       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end
  # DELETE /presentacions/1
  # DELETE /presentacions/1.json
  def destroy
    @presentacion.destroy
    respond_to do |format|
      msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentacion
      @presentacion = Presentacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentacion_params
      params.require(:presentacion).permit(:descripcion)
    end
end
