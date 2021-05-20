class AddFirstkanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstkana, :string
  end
end
