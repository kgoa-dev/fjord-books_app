class AddUserDetailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :address, :text
    add_column :users, :self_introduction, :text
  end
end
