class ProFarsController < ApplicationController
  before_action :set_pro_far, only: [:show, :edit, :update, :destroy]
  before_action :autenticacion

  # GET /pro_fars
  # GET /pro_fars.json
 

  # GET /pro_fars/1
  # GET /pro_fars/1.json
  def show
     id =  session[:farmacia_id]
     laboratorio = params[:id]
     @lab =  Laboratorio.find_by_sql("select nombre, id from laboratorios where id = #{laboratorio} ").first    
    sql = "Select * from productos where not exists (select * from pro_fars where pro_fars.producto_id = productos.id and pro_fars.farmacium_id = #{id}) and laboratorio_id = #{laboratorio} and productos.activo = true order by nombre"
    @productos =  Producto.paginate_by_sql(sql, :page => params[:page], :per_page => 8)
       @pro_far = ProFar.new
    render :template => "pro_fars/index"
  end
   # producto por anadir busqueda
  def showBusqueda
     id =  session[:farmacia_id]
     laboratorio = params[:laboratorio]
     nombre = params[:producto_id]
     @lab =  Laboratorio.find_by_sql("select nombre, id from laboratorios where id = #{laboratorio} ").first    
    sql = "Select * from productos where not exists (select * from pro_fars where pro_fars.producto_id = productos.id and pro_fars.farmacium_id = #{id}) and laboratorio_id = #{laboratorio} and LOWER(nombre) like LOWER('%#{nombre}%') order by nombre"
    @productos =  Producto.paginate_by_sql(sql, :page => params[:page], :per_page => 8)

       @pro_far = ProFar.new
    render :template => "pro_fars/index"
  end
  # GET /lab_fars
  # productos de un laboratorio farmacia agregados
  def pro_farm
       id =  session[:farmacia_id]
     laboratorio = params[:id]
     @lab =  Laboratorio.find_by_sql("select id, nombre from laboratorios where id = #{laboratorio} ").first   
   sql = "select * from pro_fars, productos, disponibilidads where pro_fars.producto_id = productos.id and disponibilidads.id =pro_fars.disponibilidad_id and productos.laboratorio_id = #{laboratorio} and pro_fars.farmacium_id = #{id} order by productos.nombre"
   @productos =  ProFar.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "pro_fars/productosfarmacia"
  end
   # GET /lab_fars
  #  busqueda productos de un laboratorio farmacia agregados
  def pro_farmBusqueda
     id =  session[:farmacia_id]
     laboratorio = params[:laboratorio]
     nombre = params[:producto_id]
     @lab =  Laboratorio.find_by_sql("select id, nombre from laboratorios where id = #{laboratorio} ").first
     sql = "select * from pro_fars, productos, disponibilidads where pro_fars.producto_id = productos.id and disponibilidads.id =pro_fars.disponibilidad_id and productos.laboratorio_id = #{laboratorio} and pro_fars.farmacium_id = #{id} and LOWER(productos.nombre) like LOWER('%#{nombre}%') order by productos.nombre"
    @productos =  ProFar.paginate_by_sql(sql, :page => params[:page], :per_page => 7)
    render :template => "pro_fars/productosfarmacia"
  end

  # GET /pro_fars/new
  def new
    @pro_far = ProFar.new
  end

  # GET /pro_farmacia_edit/:id
  def pro_farm_edit
    @pro_far = ProFar.where(["producto_id = ? and farmacium_id = ?", params[:id], session[:farmacia_id]]).first
    render :template => "pro_fars/edit"
  end

  # POST /pro_fars
  # POST /pro_fars.json
  def create
   
    @pro_far = ProFar.new
    @pro_far.farmacium_id = session[:farmacia_id]
    @pro_far.producto_id = params[:pro_far][:producto_id]
    @pro_far.disponibilidad_id = params[:pro_far][:disponibilidad_id]
    @pro_far.activo_produc = true


    respond_to do |format|
      if @pro_far.save
        id =  params[:pro_far][:farmacium_id]
         format.html { redirect_to "/pro_fars/#{id}", notice: 'Producto añadido a su farmacia exitosamente.' }
        format.html { redirect_to @pro_far, notice: 'Producto añadido a su farmacia exitosamente.' }
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
       disponibilidad = params[:pro_far][:disponibilidad_id]
        id = params[:id]
        laboratorio = params[:pro_far][:producto_id]
        ProFar.where(id: id).update_all(disponibilidad_id: disponibilidad )
      format.html { redirect_to "/pro_farmacia/#{laboratorio}", notice: 'Disponibilidad producto actualizado con éxito.' }
    end

  end
  # Metodo para actualizar activo de productos farmacia
  def pro_farm_update
      respond_to do |format|
       activo = params[:pro_far][:activo_produc]
       farmacia_id = session[:farmacia_id]
        id = params[:id]
        ProFar.where(producto_id: id, farmacium_id:farmacia_id).update_all(activo_produc: activo )
       msg = { :status => "ok", :message => "Actualizado!" }
        format.json { render :json => msg }
    end
  end

  # DELETE /pro_fars/1
  # DELETE /pro_fars/1.json
  def destroy
    @pro_far = ProFar.where(["producto_id = ? and farmacium_id = ?", params[:id], session[:farmacia_id]]).first
    @pro_far.destroy
    respond_to do |format|
       msg = { :status => "ok", :message => "Eliminado!" }
        format.json { render :json => msg }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_far
      # @pro_far = ProFar.find(params[:id])
       
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_far_params
      params.require(:pro_far).permit(:farmacium_id, :producto_id, :disponibilidad_id, :activo_produc, :laboratorio)
    end
end
