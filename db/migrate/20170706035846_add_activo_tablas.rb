class AddActivoTablas < ActiveRecord::Migration
  def change
  	add_column :laboratorios, :activo, :boolean, default: true
  	add_column :plan_pacientes, :activo, :boolean, default: true
  	add_column :presentacions, :activo, :boolean, default: true
  	add_column :productos, :activo, :boolean, default: true
  	add_column :sustancia, :activo, :boolean, default: true

  end
end
