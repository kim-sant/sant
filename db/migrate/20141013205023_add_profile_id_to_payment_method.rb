class AddProfileIdToPaymentMethod < ActiveRecord::Migration
  def change
    add_column :payment_methods, :profile_id, :integer
  end
end
