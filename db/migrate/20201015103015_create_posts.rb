class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :header
      t.string :body
      t.timestamps
    end
  end
end
