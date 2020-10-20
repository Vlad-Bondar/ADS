class RenameColumCategoryToTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :category, :title
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
