class Order < ActiveRecord::Base
  
  has_many :order_selections, :dependent => :destroy
  belongs_to :customer
  
  after_create :assign_order_number
  
  def assign_order_number
    charset = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    chars = ""
    count = 0
    while chars == "" || Order.where(order_number: chars).present?
      while count < 4
        chars = chars + charset[rand(61)].upcase
        count = count + 1
      end
      number = Time.now.month.to_s + "-" + Time.now.yday.to_s + "-" + chars
    end
    self.order_number = number
    self.save
  end
  
  def assign_total
    total = 0
    self.order_selections.each do |selection|
      if selection.product_id.present?
        total = total + (selection.product.price * selection.quantity)
      else
        total = total + (selection.subscription_plan.price)
      end
    end
    self.subtotal = total.to_f
    self.save
  end
  
  def copy_cart(cart)
    cart.cart_selections.each do |selection|
      selection.order_copy(self)
      selection.destroy
    end
  end
  
  def items
    count = 0
    self.order_selections.each do |selection|
      count = count + selection.quantity
    end
    count
  end
  
  def selections_display
    selections = ""
    self.order_selections.each do |selection|
      if selection.product_id.present?
        selections = selections + selection.product.name + " (" + selection.quantity + "), "
      else
        selections = selections + selection.subscription_plan.product.name + " (1), "
      end
    end
    return selections
  end
end
