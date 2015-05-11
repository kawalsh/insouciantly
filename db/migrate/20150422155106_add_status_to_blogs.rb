class AddStatusToBlogs < ActiveRecord::Migration
  def change
  	add_column :blogs, :status, :string, :null => "false", :default => "pending"
  end
end
