class DeletepasswordToFarmacium < ActiveRecord::Migration
  def up
    remove_column :farmacia, :password
  end

  def down
    add_column :farmacia, :password_digest, :encrypted_password
  end
end
