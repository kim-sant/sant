class ChangeProfileIdToCustomerId < ActiveRecord::Migration
  def change
    rename_column :payment_methods, :profile_id, :customer_id
  end
end
