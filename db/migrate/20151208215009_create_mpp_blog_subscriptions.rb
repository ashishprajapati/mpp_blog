class CreateMppBlogSubscriptions < ActiveRecord::Migration
  def change
    create_table :mpp_blog_subscriptions do |t|
      t.string :email
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
