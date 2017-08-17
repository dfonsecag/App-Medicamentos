class DisponibilidadsController < ApplicationController
  before_action :set_disponibilidad, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion
  before_action :verificarUsuario

  # GET /disponibilidads
  # GET /disponibilidads.json
  def index
    @disponibilidads = Disponibilidad.all
  end

  # GET /disponibilidads/1
  # GET /disponibilidads/1.json
  def show
  end

  # GET /disponibilidads/new
  def new
    @disponibilidad = Disponibilidad.new
  end

  # GET /disponibilidads/1/edit
  def edit
  end

  # POST /disponibilidads
  # POST /disponibilidads.json
  def create
    @disponibilidad = Disponibilidad.new(disponibilidad_params)

    respond_to do |format|
      if @disponibilidad.save
         format.html { redirect_to "/disponibilidads/new", notice: 'Disponibilidad creada con éxito.' }
      else
        format.html { render :new }
        format.json { render json: @disponibilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disponibilidads/1
  # PATCH/PUT /disponibilidads/1.json
  def update
    respond_to do |format|
      if @disponibilidad.update(disponibilidad_params)
        format.html { redirect_to "/disponibilidads", notice: 'Disponibilidad actualizada con éxito.' }
      else
        format.html { render :edit }
        format.json { render json: @disponibilidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disponibilidads/1
  # DELETE /disponibilidads/1.json
  def destroy
    @disponibilidad.destroy
    respond_to do |format|
      msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disponibilidad
      @disponibilidad = Disponibilidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disponibilidad_params
      params.require(:disponibilidad).permit(:nombre)
    end
end
