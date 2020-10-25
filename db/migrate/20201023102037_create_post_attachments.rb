class CreatePostAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_attachments do |t|
      t.string :attachment
      t.references :post
      t.timestamps
    end
  end
end
