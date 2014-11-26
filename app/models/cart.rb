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
end
