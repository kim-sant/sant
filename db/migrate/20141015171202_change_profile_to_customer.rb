class ChangeProfileToCustomer < ActiveRecord::Migration
  def change
    rename_table :profiles, :customers
    rename_column :carts, :profile_id, :customer_id
    rename_column :orders, :profile_id, :customer_id
    rename_column :profile_addresses, :profile_id, :customer_id
  end
end
