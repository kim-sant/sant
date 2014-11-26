class AddDefaultToPaymentMethod < ActiveRecord::Migration
  def change
    add_column :payment_methods, :default, :boolean
  end
end
