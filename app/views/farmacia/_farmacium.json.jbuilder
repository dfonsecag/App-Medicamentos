json.extract! farmacium, :id, :nombre, :cedulaJur, :sucursal, :direccion, :correo, :telefono1, :telefono2, :latitud, :longitud, :cant_lab, :activo, :created_at, :updated_at
json.url farmacium_url(farmacium, format: :json)
