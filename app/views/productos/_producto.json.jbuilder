json.extract! producto, :id, :nombre, :sustancia_id, :presentacion_id, :oferta, :laboratorio_id, :plan_paciente_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
