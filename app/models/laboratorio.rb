class Laboratorio < ActiveRecord::Base
	validates :nombre,  presence:  { message: "Campo obligatorio" }
end
