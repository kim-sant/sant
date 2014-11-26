class RegistrationsController < Devise::RegistrationsController

  def new
    if params[:callback].present?
      @callback = params[:callback]
    end
    super
  end
  
  def create
    if params[:user][:callback].present?
      build_resource(sign_up_params)

      resource_saved = resource.save
      yield resource if block_given?
      if resource_saved
        cart = Cart.find(session[:cart_id])
        cart.customer_id = resource.customer.id
        cart.save
        session.delete(:cart_id)
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          redirect_to address_step_path
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        @validatable = devise_mapping.validatable?
        if @validatable
          @minimum_password_length = resource_class.password_length.min
        end
        respond_with resource, callback: "checkout"
      end
    else
      super
    end
  end
  
  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end
  
end