class CreateLabFars < ActiveRecord::Migration
  def change
    create_table :lab_fars do |t|
      t.references :farmacium, index: true, foreign_key: true
      t.references :laboratorio, index: true, foreign_key: true
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
