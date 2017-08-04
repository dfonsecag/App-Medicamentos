class Farmacium < ActiveRecord::Base
    has_secure_password
    
	#   validates :nombre, :latitud, :longitud, :cedulaJur, :direccion,:telefono1,:correo,  presence:  { message: "Campo obligatorio" }
	
 #    validates :correo, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
 #  	validates :telefono1,  numericality: {  message: "Ingrese un número de telefono válido.",only_integer: true }
 #    validates :telefono1, length: { is: 8, :message => "Debe tener 8 digitos" }
 #    validates :telefono2,  numericality: {  message: "Ingrese un número de telefono válido.",only_integer: true }
 #    validates :telefono2, length: { is: 8, :message => "Debe tener 8 digitos" }
 #    validates :correo, uniqueness: { message: "Correo ya existe" }
 #    validates :password, presence: { message: "Campo obligatorio" }, on: :create 
  	
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
