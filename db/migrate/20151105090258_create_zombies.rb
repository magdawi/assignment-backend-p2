class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.string :graveyard
      t.date :day_of_death
      t.integer :no_of_arms
      t.text :description

      t.timestamps null: false
    end
  end
end
