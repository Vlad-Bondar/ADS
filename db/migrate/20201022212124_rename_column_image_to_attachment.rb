class RenameColumnImageToAttachment < ActiveRecord::Migration[6.0]
  def change
    rename_column :images, :image, :attachment
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
