class AddImageColumnIntoPostsTableDropPostAttachmentTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :post_attachments
    add_column :posts, :images, :string, array: true , default: []
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
