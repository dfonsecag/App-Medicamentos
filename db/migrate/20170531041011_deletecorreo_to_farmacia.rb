class DeletecorreoToFarmacia < ActiveRecord::Migration
  def change
  	remove_column :farmacia, :correo, :string
  end
end
