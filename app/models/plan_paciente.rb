class PlanPaciente < ActiveRecord::Base
validates :nombre,  presence:  { message: "Campo obligatorio" }
  
end
