class ChangeCategoryColumnIn < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :category_id, :integer , :default => 1
    #Ex:- :default =>''
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
