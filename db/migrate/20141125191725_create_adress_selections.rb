class CreateAddressSelections < ActiveRecord::Migration
  def change
    create_table :address_selections do |t|
      t.integer :address_id
      t.integer :order_id

      t.timestamps
    end
  end
end
