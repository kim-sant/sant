ActiveAdmin.register User do
  menu :priority => 2
  menu label: "Customers"

  permit_params :email, :password, :password_confirmation, :role

  index do
    column "Name" do |user|
      if user.customer.name.present?
        user.customer.name.titleize
      end
    end
    column("Email") {|user| link_to "#{user.email}", admin_user_path(user) }
    column "Cart Items?" do |user|
      if user.customer.cart.present? && user.customer.cart.cart_selections.present?
        "YES"
      end
    end
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  
  filter :email
  
  show do
    panel "Subscriptions" do
      table_for(user.customer.subscriptions) do |b|
        b.column("Product") { |s| Product.find(s.product_id).name }
        b.column("Type") { |s| "Monthly" }
        b.column("Deliveries") { |s| "5" }
        b.column("Price") { |s| number_to_currency(Product.find(s.product_id).price, precision: 2) }
        b.column("Status") { |s| s.active ? "active" : "cancelled" }
      end
    end
    panel "Order History" do
      table_for(user.customer.orders) do |b|
        b.column("Order#") { |order| link_to order.order_number, admin_order_path(order) }
        b.column("Items") { |order| order.items }
        b.column("Total") { |order| number_to_currency(order.subtotal, precision: 2) }
        b.column "Edit" do |order|
          link_to "Edit Order", ""
        end
      end
    end
  end
  
  sidebar :customer_information, :only => :show do
    attributes_table_for user.customer do
      if user.customer.address.present?
        row("Name") { "#{user.customer.address.first_name.capitalize} #{user.customer.address.last_name.capitalize}" }
        row("Address") { "#{user.customer.address.line_1} #{user.customer.address.line_2}" }
        row("City") { "#{user.customer.address.city}, #{user.customer.address.state}" }
        row("Zip") { user.customer.address.zip }
      end
    end
  end

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
