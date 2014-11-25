class CreateAdressSelections < ActiveRecord::Migration
  def change
    create_table :adress_selections do |t|
      t.integer :address_id
      t.integer :order_id

      t.timestamps
    end
  end
end
