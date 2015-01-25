class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.string :product_id
      t.integer :interval_weeks
      t.float :price

      t.timestamps
    end
  end
end
