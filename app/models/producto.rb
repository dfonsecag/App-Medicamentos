class Producto < ActiveRecord::Base
  belongs_to :sustancium
  belongs_to :presentacion
  belongs_to :laboratorio
  belongs_to :plan_paciente
  
  validates :nombre,  presence:  { message: "Campo obligatorio" }
  validates :compra, :oferta , numericality: {  message: "Número",only_integer: true }
  
  
end
