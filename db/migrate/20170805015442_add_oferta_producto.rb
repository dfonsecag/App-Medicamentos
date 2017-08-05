class AddOfertaProducto < ActiveRecord::Migration
  def change
  	remove_column :productos, :oferta, :string
  	add_column :productos, :oferta1, :integer
  	add_column :productos, :oferta2, :integer
  end
end
