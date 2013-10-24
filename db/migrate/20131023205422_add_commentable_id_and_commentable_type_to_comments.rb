class AddCommentableIdAndCommentableTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string

    remove_column :comments, :post_id
  end
  add_index :comments, [:commentable_id, :commentable_type]
end
