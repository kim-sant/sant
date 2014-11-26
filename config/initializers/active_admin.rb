ActiveAdmin.setup do |config|

  config.site_title = "Ecommerce"

  config.authentication_method = :authenticate_active_admin_user!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path  
  config.logout_link_method = :delete
  
  config.batch_actions = true

  config.show_comments_in_menu = false

end
