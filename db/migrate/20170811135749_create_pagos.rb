class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.references :farmacium, index: true, foreign_key: true
      t.decimal :monto
      t.integer :numcomprobante
      t.integer :cantLab

      t.timestamps null: false
    end
  end
end
