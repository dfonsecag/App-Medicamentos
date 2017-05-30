class FarmaciaController < ApplicationController
  before_action :set_farmacium, only: [:show, :edit, :update, :destroy]

  # GET /farmacia
  # GET /farmacia.json
  def index
    @farmacia = Farmacium.all
  end

  # GET /farmacia/1
  # GET /farmacia/1.json
  def show
  end

  # GET /farmacia/new
  def new
    @farmacium = Farmacium.new
  end

  # GET /farmacia/1/edit
  def edit
  end

  # POST /farmacia
  # POST /farmacia.json
  def create
    @farmacium = Farmacium.new(farmacium_params)

    respond_to do |format|
      if @farmacium.save
        UserNotifier.send_signup_email(@farmacium).deliver
        format.html { redirect_to "/farmacia/new", notice: 'Farmacia creada con éxito.' }
       
      else
        format.html { render :new }
        format.json { render json: @farmacium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farmacia/1
  # PATCH/PUT /farmacia/1.json
  def update
    respond_to do |format|
      if @farmacium.update(farmacium_params)
        format.html { redirect_to @farmacium, notice: 'Farmacia se actualizó con éxito.' }
        format.json { render :show, status: :ok, location: @farmacium }
      else
        format.html { render :edit }
        format.json { render json: @farmacium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmacia/1
  # DELETE /farmacia/1.json
  def destroy
    @farmacium.destroy
    respond_to do |format|
      format.html { redirect_to farmacia_url, notice: 'Farmacium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmacium
      @farmacium = Farmacium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmacium_params
      params.require(:farmacium).permit(:nombre, :cedulaJur, :sucursal, :direccion, :correo, :telefono1, :telefono2, :latitud, :longitud, :cant_lab, :activo, :photo)
    end
end
