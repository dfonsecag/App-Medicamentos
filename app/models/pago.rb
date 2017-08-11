class Pago < ActiveRecord::Base
  belongs_to :farmacia
  	validates :numcomprobante, :monto, :cantLab,  presence:  { message: "Campo obligatorio" }
    validates :monto,  numericality: {  message: "Ingrese un número.",only_integer: true }
end
