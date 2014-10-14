class HomepageController < ApplicationController
  
  def index
    
  end
  
  def profile
    if !user_signed_in?
      redirect_to root_url
    end
  end
  
end
