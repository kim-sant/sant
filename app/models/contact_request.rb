class ContactRequest < ActiveRecord::Base

  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :phone, :with => /(\(|)\d{3}(\) |\)|\.|\-| |)\d{3}(\.|\-| |)\d{4}/i, :allow_blank => true
  validates :subject, presence: true
  validates :text, presence: true  

  def email_format
    self.email = self[:email].downcase
  end

  def name_format
    self.name = self[:name].titleize if self.name
  end

  def number_to_phone(number, options = {})
    return unless number
    options = options.symbolize_keys

    parse_float(number, true) if options.delete(:raise)
    ERB::Util.html_escape(ActiveSupport::NumberHelper.number_to_phone(number, options))
  end

  def phone_format
    self.phone = number_to_phone(self[:phone].gsub(/\D/, '').to_i, area_code: true) if self.phone
  end

end
