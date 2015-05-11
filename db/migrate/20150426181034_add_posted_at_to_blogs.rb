class AddPostedAtToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :posted_at, :datetime
  end
end
