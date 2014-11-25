class CreatePaymentSelections < ActiveRecord::Migration
  def change
    create_table :payment_selections do |t|
      t.integer :payment_method_id
      t.integer :order_id

      t.timestamps
    end
  end
end
