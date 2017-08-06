class DeleteOferta < ActiveRecord::Migration
  def change
  	remove_column :productos, :compra, :integer
  	remove_column :productos, :oferta, :integer
  	add_column :productos, :oferta, :string
  end
end
