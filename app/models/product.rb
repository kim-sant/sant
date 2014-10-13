class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :create_slug, use: :slugged
  mount_uploader :image, ImageUploader
  
  def create_slug
    "#{name.parameterize}"
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
  
end
