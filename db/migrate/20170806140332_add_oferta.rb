class AddOferta < ActiveRecord::Migration
  def change
  	remove_column :productos, :oferta, :string
  	add_column :productos, :compra, :integer
  	add_column :productos, :oferta, :integer
  end
end
