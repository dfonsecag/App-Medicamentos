class CreateProFars < ActiveRecord::Migration
  def change
    create_table :pro_fars do |t|
      t.references :farmacium, index: true, foreign_key: true
      t.references :producto, index: true, foreign_key: true
      t.references :disponibilidad, index: true, foreign_key: true
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
