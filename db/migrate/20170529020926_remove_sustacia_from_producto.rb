class RemoveSustaciaFromProducto < ActiveRecord::Migration
  def change
    remove_column :productos, :sustancium_id, :integer
  end
end
