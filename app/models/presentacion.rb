class Presentacion < ActiveRecord::Base
	validates :descripcion,  presence:  { message: "Campo obligatorio" }
end
