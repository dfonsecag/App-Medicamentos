class AddVerificado < ActiveRecord::Migration
  def change
  	add_column :farmacia, :verificado, :boolean, default: false	
  end
end
