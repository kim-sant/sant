class CreateProfileAddresses < ActiveRecord::Migration
  def change
    create_table :profile_addresses do |t|
      t.integer :profile_id
      t.integer :address_id

      t.timestamps
    end
  end
end
