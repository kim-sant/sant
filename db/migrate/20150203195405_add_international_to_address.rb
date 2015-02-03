class AddInternationalToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :international, :boolean
    add_column :addresses, :country, :string
  end
end
