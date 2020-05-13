class AddPasswordForKillers < ActiveRecord::Migration
  def change
    add_column :killers, :password_digest, :string
  end
end
