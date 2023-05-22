class AddFacebookFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :facebook_first_name, :string
    add_column :users, :facebook_last_name, :string
    add_column :users, :facebook_image, :string
  end
end
