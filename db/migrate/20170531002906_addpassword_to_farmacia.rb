class AddpasswordToFarmacia < ActiveRecord::Migration
  def change
  	add_column :farmacia, :password_digest, :string
  end
end
