class AddImageTable < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :post_id

      t.timestamps
    end

    remove_column :posts, :images
  end
end
