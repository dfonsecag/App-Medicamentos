class AddSustanciaRefToProduct < ActiveRecord::Migration
  def change
    add_reference :productos, :sustancium, index: true, foreign_key: true
  end
end
