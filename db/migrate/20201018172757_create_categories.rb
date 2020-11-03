class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category 
      t.timestamps
    end
    
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end


end
