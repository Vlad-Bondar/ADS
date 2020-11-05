class CreatePostsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :header
      t.string :body
      t.string :images, default: [], array: true
      t.string :status, default: "draft"
      t.integer :category_id, default: 1
      t.bigint :user_id
      t.timestamps
    end
    
      add_index :posts, :category_id,   unique: true
      add_index :posts, :user_id,       unique: true    
  end
end
