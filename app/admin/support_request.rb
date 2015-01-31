ActiveAdmin.register SupportRequest do
  menu :priority => 5
  
  permit_params :name, :email , :message
  
  index do
      column :name
      column :email
      column :message
      column :created_at
      actions
  end

  filter :name
  filter :email

end