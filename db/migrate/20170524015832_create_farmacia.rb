class CreateFarmacia < ActiveRecord::Migration
  def change
    create_table :farmacia do |t|
      t.string :nombre
      t.string :cedulaJur
      t.string :sucursal
      t.string :direccion
      t.string :correo
      t.integer :telefono1
      t.integer :telefono2
      t.string :latitud
      t.string :longitud
      t.integer :cant_lab
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
