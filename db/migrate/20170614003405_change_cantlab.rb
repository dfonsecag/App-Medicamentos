class ChangeCantlab < ActiveRecord::Migration
  def change
  	remove_column :farmacia, :cant_lab, :integer
  	add_column :farmacia, :cant_lab, :integer, default: 5
  end
end
