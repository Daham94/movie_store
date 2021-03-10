class AddIsUserToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :is_user, :boolean, :default => false
  end
end
