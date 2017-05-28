class TipoPlan < ActiveRecord::Base
  belongs_to :plan_paciente
  validates :descripcion,  presence:  { message: "Campo obligatorio" }
end
