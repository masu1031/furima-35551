class AddLastkanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :lastkana, :string
  end
end
