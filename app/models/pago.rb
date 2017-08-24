class Pago < ActiveRecord::Base
  belongs_to :farmacia
  	validates :numcomprobante,  presence:  { message: "Campo obligatorio" }
    validates :numcomprobante,  numericality: {  message: "Ingrese un número.",only_integer: true }
end
