class PlanPaciente < ActiveRecord::Base
  validates :nombre,  presence:  { message: "Campo obligatorio" }
  belongs_to :laboratorio
end
