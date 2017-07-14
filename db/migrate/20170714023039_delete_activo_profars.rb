class DeleteActivoProfars < ActiveRecord::Migration
  def change
  	remove_column :pro_fars, :activo, :boolean
  	add_column :pro_fars, :activo_produc, :boolean, default: true
  end
end
