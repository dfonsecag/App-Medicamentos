class ProFarsController < ApplicationController
  before_action :set_pro_far, only: [:show, :edit, :update, :destroy]

  # GET /pro_fars
  # GET /pro_fars.json
  def index
    @pro_fars = ProFar.all
  end

  # GET /pro_fars/1
  # GET /pro_fars/1.json
  def show
  end

  # GET /pro_fars/new
  def new
    @pro_far = ProFar.new
  end

  # GET /pro_fars/1/edit
  def edit
  end

  # POST /pro_fars
  # POST /pro_fars.json
  def create
    @pro_far = ProFar.new(pro_far_params)

    respond_to do |format|
      if @pro_far.save
        format.html { redirect_to @pro_far, notice: 'Pro far was successfully created.' }
        format.json { render :show, status: :created, location: @pro_far }
      else
        format.html { render :new }
        format.json { render json: @pro_far.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_fars/1
  # PATCH/PUT /pro_fars/1.json
  def update
    respond_to do |format|
      if @pro_far.update(pro_far_params)
        format.html { redirect_to @pro_far, notice: 'Pro far was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_far }
      else
        format.html { render :edit }
        format.json { render json: @pro_far.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_fars/1
  # DELETE /pro_fars/1.json
  def destroy
    @pro_far.destroy
    respond_to do |format|
      format.html { redirect_to pro_fars_url, notice: 'Pro far was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_far
      @pro_far = ProFar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_far_params
      params.require(:pro_far).permit(:farmacia_id, :producto_id, :disponibiliad_id, :activo)
    end
end
