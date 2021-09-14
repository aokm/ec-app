class CreateTempOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :temp_orders do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
