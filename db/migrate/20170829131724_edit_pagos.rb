class EditPagos < ActiveRecord::Migration
  def change
  	remove_column :pagos, :cantLab, :integer
  	add_column :pagos, :verificado, :boolean, default: false
  end
end
