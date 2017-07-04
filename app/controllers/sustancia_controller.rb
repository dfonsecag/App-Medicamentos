class SustanciaController < ApplicationController
  before_action :set_sustancium, only: [:show, :edit, :update, :destroy]
   before_action :autenticacion
   before_action :verificarUsuario

  # GET /sustancia
  # GET /sustancia.json
  def index
    @sustancia = Sustancium.paginate(:page => params[:page], :per_page => 8)
  end
def busqueda
    nombre = params[:nombre]
      
   sql = "select * from sustancia where LOWER(descripcion) like LOWER('%#{nombre}%')"
    @sustancia =  Sustancium.paginate_by_sql(sql, :page => params[:page], :per_page => 8)
    render :template => "sustancia/index"
  end
  # GET /sustancia/1
  # GET /sustancia/1.json
  def show
  end

  # GET /sustancia/new
  def new
    @sustancium = Sustancium.new
  end

  # GET /sustancia/1/edit
  def edit
  end

  # POST /sustancia
  # POST /sustancia.json
  def create
    @sustancium = Sustancium.new(sustancium_params)

    respond_to do |format|
      if @sustancium.save
         format.html { redirect_to "/sustancia/new", notice: 'Sustancia creada con éxito.' }
        format.json { render :show, status: :created, location: @sustancium }
      else
        format.html { render :new }
        format.json { render json: @sustancium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sustancia/1
  # PATCH/PUT /sustancia/1.json
  def update
    respond_to do |format|
      if @sustancium.update(sustancium_params)
        format.html { redirect_to "/sustancia", notice: 'Sustancia actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @sustancium }
      else
        format.html { render :edit }
        format.json { render json: @sustancium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sustancia/1
  # DELETE /sustancia/1.json
  def destroy
    @sustancium.destroy
    respond_to do |format|
      msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sustancium
      @sustancium = Sustancium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sustancium_params
      params.require(:sustancium).permit(:descripcion)
    end
end
