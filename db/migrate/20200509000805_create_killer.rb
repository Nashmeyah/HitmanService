class CreateKiller < ActiveRecord::Migration
  def change
    create_table :killers do |t|
      t.string :name
      t.string :email
      t.string :specialty
    end
  end
end
