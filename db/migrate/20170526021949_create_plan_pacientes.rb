class CreatePlanPacientes < ActiveRecord::Migration
  def change
    create_table :plan_pacientes do |t|
      t.string :nombre
      t.references :laboratorio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
