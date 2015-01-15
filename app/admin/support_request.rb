ActiveAdmin.register SupportRequest do
  menu :priority => 4
  
  permit_params :name, :email , :message
  
  index do
      column :name
      column :email
      column :message
      actions
  end

  filter :name
  filter :email

end