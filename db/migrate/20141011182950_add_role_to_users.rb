class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    
    # User.create!(email: 'admin@example.com', password: 'admin123', role: 'administrator')
  end
end
