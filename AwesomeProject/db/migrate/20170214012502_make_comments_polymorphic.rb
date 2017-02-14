class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    remove_column :comments, :user_id, :integer
    remove_column :comments, :contact_id, :integer
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
