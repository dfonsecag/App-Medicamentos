class CreateSustancia < ActiveRecord::Migration
  def change
    create_table :sustancia do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
