class SupportRequest < ActiveRecord::Base
  
  validates :email, presence: true, email_format: true
  validates :message, presence: true
  
end
