class PagesController < InheritedResources::Base
  
  def homepage
    if session[:cart_id].present? && !Cart.find(session[:cart_id]).present?
      session.delete(:cart_id)
    end
  end
  
  def about
    
  end
  
  def help
    
  end
  
  def recipes
    
  end
  
  def earn_credit
    
  end
  
end