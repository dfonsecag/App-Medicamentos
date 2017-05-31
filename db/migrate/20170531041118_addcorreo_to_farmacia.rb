class AddcorreoToFarmacia < ActiveRecord::Migration
  def change
  	add_column :farmacia, :correo, :string, unique: true
  end
end
