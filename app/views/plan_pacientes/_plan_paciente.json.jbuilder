json.extract! plan_paciente, :id, :nombre, :laboratorio_id, :created_at, :updated_at
json.url plan_paciente_url(plan_paciente, format: :json)
