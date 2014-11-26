class Cart < ActiveRecord::Base
  
  has_many :cart_selections
  belongs_to :customer
  
  def subtotal
    total = 0
    self.cart_selections.each do |selection|
      total = (total + (selection.product.price*selection.quantity)).to_f
    end
    total
  end
  
  def items
    count = 0
    self.cart_selections.each do |selection|
      count = count + selection.quantity
    end
    count
  end
end
