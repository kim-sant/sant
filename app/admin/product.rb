ActiveAdmin.register Product do
  
  permit_params :name, :price , :image , :slug
  
  form(:html => { :multipart => true }) do |f|
    f.inputs "Product" do
      f.input :name
      f.input :price
      f.input :image, :as => :file
    end
    f.actions
  end

end
