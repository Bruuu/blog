class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.string :slug
      t.string :image
      t.integer :status, default: 0
      t.datetime :published_at
      t.string :meta_title
      t.text :meta_description

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end
