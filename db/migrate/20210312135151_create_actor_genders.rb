class CreateActorGenders < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_genders do |t|
      t.string :gender
    end
  end
end
