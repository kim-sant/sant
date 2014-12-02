class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :create_slug, use: :slugged
  mount_uploader :image, ImageUploader
  
  has_many :subscriptions, :dependent => :destroy
  has_many :cart_selections, :dependent => :destroy
  has_many :order_selections, :dependent => :destroy
  
  def create_slug
    "#{name.parameterize}"
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
  
end
