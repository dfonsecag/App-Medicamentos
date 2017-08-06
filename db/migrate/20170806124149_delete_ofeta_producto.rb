class DeleteOfetaProducto < ActiveRecord::Migration
  def change
  	remove_column :productos, :oferta1, :integer
  	remove_column :productos, :oferta2, :integer
  	add_column :productos, :compra, :integer
  	add_column :productos, :oferta, :integer
  end
end
