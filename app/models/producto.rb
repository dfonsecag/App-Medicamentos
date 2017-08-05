class Producto < ActiveRecord::Base
  belongs_to :sustancium
  belongs_to :presentacion
  belongs_to :laboratorio
  belongs_to :plan_paciente
  
  validates :nombre,  presence:  { message: "Campo obligatorio" }
  validates :oferta1, :oferta2 , numericality: {  message: "Número",only_integer: true }
  
  
end
