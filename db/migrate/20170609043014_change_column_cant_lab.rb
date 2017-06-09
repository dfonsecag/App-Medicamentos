class ChangeColumnCantLab < ActiveRecord::Migration
  def change
  	remove_column :farmacia, :cant_lab, :integer
  	add_column :farmacia, :cant_lab, :integer, default: 0
  end
end
