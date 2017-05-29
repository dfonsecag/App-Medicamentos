class CreatePresentacions < ActiveRecord::Migration
  def change
    create_table :presentacions do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
