class Subscription < ActiveRecord::Base
  
  belongs_to :customer
  belongs_to :subscription_plan
  
  after_create :make_active
  
  def make_active
    self.active = true
    self.save
  end
  
end
