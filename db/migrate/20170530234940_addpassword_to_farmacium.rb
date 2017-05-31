class AddpasswordToFarmacium < ActiveRecord::Migration
  def change
  	add_column :farmacia, :password, :string
  end
end
