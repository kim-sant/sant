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
  
  cvs do 
    column :order_number
    column "Customer" do |order|
      User.find(order.customer.user_id).email
    end
    column "Items" do |order|
      order.order_selections.each do |selection|
        if selection.product_id.present?
          "#{selection.product.name} (#{selection.quantity})"
        else
          "#{selection.subscription_plan.product.name} (1)"
        end
      end
    end
    Meal.from_latest_menu.each do |meal|
      column "Meal Selection" do |weekly_basket|
        if weekly_basket.meal_selections.where(meal_id: meal.id).present?
          meal.title[0...10]
        else
          ""
        end
      end
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
    column "zip" do |order|
      order.customer.address.zip
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