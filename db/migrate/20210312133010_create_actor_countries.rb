class CreateActorCountries < ActiveRecord::Migration[6.0]
  def self.up
    create_table :actor_countries do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :actor_countries
  end
end
