class AddActorCountryRefToActor < ActiveRecord::Migration[6.0]
  def change
    add_reference :actors, :actor_country, null: true, foreign_key: true
  end
end
