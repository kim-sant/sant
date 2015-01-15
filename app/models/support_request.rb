class SupportRequest < ActiveRecord::Base
  
  validates :email, presence: true
  validates :message, presence: true
  
end
