class RemoveUserLevelFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :user_level, null: false, foreign_key: true
  end
end
