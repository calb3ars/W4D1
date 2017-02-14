class ChangeUserLayout < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :email, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
