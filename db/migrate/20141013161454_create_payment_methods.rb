class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :stripe_customer_token
      t.string :last_4_digits

      t.timestamps
    end
  end
end
