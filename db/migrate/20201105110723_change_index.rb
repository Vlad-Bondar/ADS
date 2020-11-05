class ChangeIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :posts, name: :index_posts_on_category_id
    remove_index :posts, name: :index_posts_on_user_id
    add_index :posts, :category_id
    add_index :posts, :user_id
    #Ex:- add_index("admin_users", "username")
  end
end
