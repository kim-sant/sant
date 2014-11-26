class Address < ActiveRecord::Base
  
  belongs_to :customer
  has_many :address_selections
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
