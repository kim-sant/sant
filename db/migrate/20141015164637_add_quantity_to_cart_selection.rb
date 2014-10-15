class AddQuantityToCartSelection < ActiveRecord::Migration
  def change
    add_column :cart_selections, :quantity, :integer
    add_column :order_selections, :quantity, :integer
  end
end
