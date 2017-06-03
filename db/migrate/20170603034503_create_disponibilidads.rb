class CreateDisponibilidads < ActiveRecord::Migration
  def change
    create_table :disponibilidads do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
