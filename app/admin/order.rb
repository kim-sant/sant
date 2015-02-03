ActiveAdmin.register Order do

  menu :priority => 4 

  index do
      column :order_number
      column "Customer" do |order|
        User.find(order.customer.user_id).email
      end
      column "Items" do |order|
        order.items
      end
      column :subtotal
      column :created_at
      actions
  end
  
  csv do 
    column "Order Number" do |order|
      order.order_number
    end
    column "Customer" do |order|
      User.find(order.customer.user_id).email
    end
    column "Ship Quantity" do |order|
      order.ship_quantity
    end
    column "First Name" do |order|
      order.customer.address.first_name
    end
    column "Last Name" do |order|
      order.customer.address.last_name
    end
    column "Address1" do |order|
      order.customer.address.line_1
    end
    column "Address2" do |order|
      order.customer.address.line_2
    end
    column "City" do |order|
      order.customer.address.city
    end
    column "State" do |order|
      order.customer.address.state
    end
    column "Zip" do |order|
      order.customer.address.zip
    end
    column "Country" do |order|
      order.customer.address.country
    end
  end

  filter :order_number
  filter :subtotal

  form do |f|
      f.inputs "User Details" do
          f.input :email
          f.input :password
          f.input :password_confirmation
          f.input :role, as: :radio, collection: {Editor: "editor", Administrator: "administrator"}
      end
      f.actions
  end

end