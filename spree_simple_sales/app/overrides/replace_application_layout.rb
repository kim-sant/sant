Deface::Override.new(virtual_path: "spree/layouts/spree_application",
	name: 'replace_application_layout',
	replace: "body",
	template: "theme/_theme")

Deface::Override.new(virtual_path: "spree/shared/_head",
  name: 'change title',
  replace: "title",
  text: "<title>Sant - The Infusable Superfruit</title>")

Deface::Override.new(virtual_path: "spree/shared/_head",
  name: 'add font awesome',
  insert_after: "title",
  text: "<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>")

# Deface::Override.new(virtual_path: "spree/shared/_products",
#   name: 'get rid of photo',
#   remove: "code[erb-loud] small_image ")

# Deface::Override.new(virtual_path: 'spree/shared/_header',
#   name: 'change_logo',
#   replace: "div.row",
#   text: "
#     <img src='http://www.idrinksant.com/assets/sant-logo-8cf94e196e0073b6678add04f8c48714.png' class='header_icon'>
#     <%= render :partial => 'spree/shared/nav_bar' %>
#   ")

# Deface::Override.new(virtual_path: 'spree/shared/_nav_bar',
#   name: 'delete_search',
#   remove: "li#search-bar",
#   )