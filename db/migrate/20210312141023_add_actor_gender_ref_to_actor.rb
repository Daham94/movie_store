class AddActorGenderRefToActor < ActiveRecord::Migration[6.0]
  def change
    add_reference :actors, :actor_gender, null: true, foreign_key: true
  end
end
