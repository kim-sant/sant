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
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end
  
  filter :email
  
  show do
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
        row("Name") { "#{user.customer.first_name.capitalize} #{user.customer.last_name.capitalize}" }
        row("Address") { "#{user.customer.address.line_1} #{user.customer.address.line_2}" }
        row("City") { "#{user.customer.address.city}, #{user.customer.address.state}" }
        row("Zip") { user.customer.address.zip }
      end
    end
  end
  
  sidebar :subscriptions, :only => :show do
    attributes_table_for user.customer do
      if user.customer.subscriptions.present?
        user.customer.subscriptions.each do |s|
          row("Product") { Product.find(s.product_id).name }
        end
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
