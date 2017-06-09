class AddVerificado < ActiveRecord::Migration
  def change
  	remove_column :farmacia, :verificado, :boolean
  	add_column :farmacia, :verificado, :boolean, default: false	
  end
end
