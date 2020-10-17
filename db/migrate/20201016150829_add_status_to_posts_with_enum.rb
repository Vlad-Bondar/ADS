class AddStatusToPostsWithEnum < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :status, :string, :default => "draft"
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
