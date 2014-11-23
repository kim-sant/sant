class SessionsController < Devise::SessionsController

  def new
    if params[:callback].present?
      @callback = params[:callback]
    end
    super
  end
  
end