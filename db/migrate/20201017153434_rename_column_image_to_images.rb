class RenameColumnImageToImages < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :image, :images
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
