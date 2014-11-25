class AddDeliveryTypeToAddressSelection < ActiveRecord::Migration
  def change
    add_column :address_selections, :delivery_type, :string
  end
end
