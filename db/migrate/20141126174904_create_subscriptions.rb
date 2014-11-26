class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :product_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
