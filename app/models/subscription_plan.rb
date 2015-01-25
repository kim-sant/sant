class SubscriptionPlan < ActiveRecord::Base
  
  belongs_to :product
  has_many :cart_selections, dependent: :destroy
  has_many :subscriptions
  
end
