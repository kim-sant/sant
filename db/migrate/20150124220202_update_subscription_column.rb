class UpdateSubscriptionColumn < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :product_id, :subscription_plan_id
  end
end
