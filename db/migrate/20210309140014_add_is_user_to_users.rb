class AddIsUserToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_user, :boolean, :default => true
  end
end
