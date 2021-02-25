class AddActorCountryRefToActor < ActiveRecord::Migration[6.0]
  def change
    add_reference :actors, :actor_country, null: false, foreign_key: true
  end
end
