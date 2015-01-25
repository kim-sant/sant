class AddSubscriptionPlanIdToCartSelection < ActiveRecord::Migration
  def change
    add_column :cart_selections, :subscription_plan_id, :integer
  end
end
