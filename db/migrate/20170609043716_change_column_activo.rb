class ChangeColumnActivo < ActiveRecord::Migration
  def change
  	 remove_column :farmacia, :activo, :boolean
  	add_column :farmacia, :activo, :boolean, default: true	
  end
end
