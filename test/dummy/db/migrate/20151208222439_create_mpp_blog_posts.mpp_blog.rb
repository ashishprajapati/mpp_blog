# This migration comes from mpp_blog (originally 20151208213817)
class CreateMppBlogPosts < ActiveRecord::Migration
  def change
    create_table :mpp_blog_posts do |t|
	  t.string :title
      t.text :content
      t.boolean :status
      t.string :avatar
      t.string :search_description
      t.boolean :popular, default: false
      t.integer :position
      t.timestamps null: false
    end
  end
end
