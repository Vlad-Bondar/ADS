class AddColumnSuperuserIntoUserTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :super_admin, :boolean, :default => false
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
