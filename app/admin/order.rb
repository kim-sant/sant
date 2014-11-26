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