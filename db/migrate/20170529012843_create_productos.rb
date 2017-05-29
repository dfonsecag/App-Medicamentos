class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.references :sustancium, index: true, foreign_key: true
      t.references :presentacion, index: true, foreign_key: true
      t.string :oferta
      t.references :laboratorio, index: true, foreign_key: true
      t.references :plan_paciente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
