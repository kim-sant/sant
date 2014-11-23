class SessionsController < Devise::SessionsController

  def new
    if params[:callback].present?
      @callback = params[:callback]
    end
    super
  end
  
  def create
    if params[:user][:callback].present?
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      redirect_to step_1_url
    else
      super
    end
  end
  
end