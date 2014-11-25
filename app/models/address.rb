class Address < ActiveRecord::Base
  
  belongs_to :customer
  
  validates :line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
