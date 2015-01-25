class AddSubscriptionPlanIdToOrderSelection < ActiveRecord::Migration
  def change
    add_column :order_selections, :subscription_plan_id, :integer
  end
end
