class Producto < ActiveRecord::Base
  belongs_to :sustancia
  belongs_to :presentacion
  belongs_to :laboratorio
  belongs_to :plan_paciente
end
