class CreateVictim < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.datetime :time_of_death
      t.string :last_words
      t.integer :killer_id
    end
  end
end
