class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :subject
      t.text :text

      t.timestamps null: false
    end
  end
end
