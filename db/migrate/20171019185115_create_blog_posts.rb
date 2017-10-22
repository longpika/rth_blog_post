class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.integer :account_id
      t.text :content

      t.timestamps
    end
  end
end
