class Producto < ActiveRecord::Base
  belongs_to :sustancium
  belongs_to :presentacion
  belongs_to :laboratorio
  belongs_to :plan_paciente
  
  validates :oferta, :compra, :numericality => true, :allow_nil => true
  
  validates :nombre,  presence:  { message: "Campo obligatorio" }
  
  
end
