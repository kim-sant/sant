class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :profile_id
      t.string :order_number
      t.float :subtotal

      t.timestamps
    end
  end
end
