class CreateActorCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_countries do |t|
      t.string :country

      t.timestamps
    end
  end
end
