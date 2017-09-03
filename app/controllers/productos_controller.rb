class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
     before_action :autenticacion
     before_action :verificarUsuario

  # GET /productos
  # GET /productos.json
  def index
     sql = "select * from productos order by nombre"
    @productos =  Producto.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
  end
  def busqueda
    nombre = params[:nombre]
      
   sql = "select * from productos where LOWER(nombre) like LOWER('%#{nombre}%') order by nombre"
    @productos =  Producto.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "productos/index"
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
           format.html { redirect_to "/productos/new", notice: 'Producto creado con éxito.' }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # Encontrar el plan paciente con un laboratorio
   def Plan_Paciente
    id = params[:id]
      plan_paciente = PlanPaciente.find_by_sql("SELECT nombre FROM plan_pacientes where laboratorio_id= #{id}")
      render json: plan_paciente
    end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to "/productos", notice: 'Producto actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end
   # Metodo para actualizar activo de producto
  def activo_update
      respond_to do |format|
       activo = params[:producto][:activo]
        id = params[:id]
        Producto.where(id: id).update_all(activo: activo )
       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto.destroy
    respond_to do |format|
       msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:nombre, :sustancium_id, :presentacion_id, :compra, :oferta, :laboratorio_id, :plan_paciente_id)
    end
end
