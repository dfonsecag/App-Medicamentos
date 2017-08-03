class Api::V1::ConsultasController < ApplicationController

	 def index
     @laboratorios = Laboratorio.all
     render json: @laboratorios 
  end
  # metodo para obtener las farmacias mas cercanas
  def FarmaciasCercanas
     @farmacias = Farmacium.find_by_sql("SELECT id, nombre,latitud, longitud FROM farmacia where correo <> 'ADMIN'")
     render json: @farmacias
  end
  # metodo para obtener informacion de la farmacia
  def InfoFarmacia
  	id = params[:id]
     @farmacias = Farmacium.find_by_sql("SELECT nombre, correo, direccion, latitud, longitud, telefono1, telefono2 FROM farmacia where id = #{id}")
     render json: @farmacias
  end
  # metodo para buscar un determinado producto
  def SearchProducto
  	nombre = params[:nombre]
       @productos = Producto.find_by_sql("select nombre, id from productos where LOWER(nombre) like LOWER('%#{nombre}%') and activo = true")
     render json: @productos
  end
  # obtiene un select de un producto determinado buscado por el usuario
  def InfoProducto
  	id = params[:id]
       @productos = Producto.find_by_sql("select distinct  productos.nombre as nombreProducto, productos.id as idProducto, productos.oferta, laboratorios.nombre as nombreLaboratorio, presentacions.descripcion, plan_pacientes.id, 
		plan_pacientes.nombre as nombrePlanPaciente, plan_pacientes.id as idPlanPaciente,
		sustancia.descripcion as descripcionSustancia
		 from productos, presentacions, plan_pacientes, laboratorios, sustancia where 
		productos.presentacion_id = presentacions.id and
		productos.laboratorio_id = laboratorios.id and
		productos.sustancium_id = sustancia.id and
		productos.id = #{id} LIMIT 1")
     render json: @productos
  end
  
   # metodo para buscar un determinado producto
  def InfoPlanPaciente
  	id = params[:id]
       @plan_paciente = TipoPlan.find_by_sql("select  descripcion  FROM tipo_plans where plan_paciente_id = #{id} and tipo = 'Paciente'")
     render json: @plan_paciente
  end
   # metodo para buscar farmacias cercanas que tengan un determinado producto
  def FarmaciasCercanaSearch
  	id = params[:id]
       @farmacias = ProFar.find_by_sql("select pro_fars.id, farmacia.nombre, farmacia.latitud, farmacia.longitud	
  FROM pro_fars, farmacia where activo_produc= true  and producto_id = #{id} and pro_fars.farmacium_id = farmacia.id")
     render json: @farmacias
  end
   # metodo para buscar informacion de producto farmacia de un producto especifico
  def infoFarmaciaProducto
  	id = params[:id]
       @farmacias = ProFar.find_by_sql("SELECT disponibilidads.nombre as nombreDisponibilidad, presentacions.descripcion, productos.nombre as nombreProducto,farmacia.nombre, farmacia.correo, farmacia.direccion, farmacia.latitud, farmacia.longitud, farmacia.telefono1, 
		farmacia.telefono2 FROM farmacia, productos, disponibilidads, pro_fars, presentacions
		where pro_fars.id = #{id} and pro_fars.farmacium_id = farmacia.id and pro_fars.producto_id = productos.id and pro_fars.disponibilidad_id = disponibilidads.id and
		presentacions.id = presentacion_id;")
		     render json: @farmacias
  end

end
