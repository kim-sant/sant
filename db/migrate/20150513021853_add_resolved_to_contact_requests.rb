class AddResolvedToContactRequests < ActiveRecord::Migration
  def change
    add_column :contact_requests, :resolved, :boolean
  end
end
