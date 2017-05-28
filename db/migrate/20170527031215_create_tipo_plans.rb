class CreateTipoPlans < ActiveRecord::Migration
  def change
    create_table :tipo_plans do |t|
      t.string :tipo
      t.string :descripcion
      t.references :plan_paciente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
