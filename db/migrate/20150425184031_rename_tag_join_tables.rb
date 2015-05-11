class RenameTagJoinTables < ActiveRecord::Migration
  def change
    rename_table :blog_tags, :blogs_tags
    rename_table :project_tags, :projects_tags
    rename_table :photo_tags, :photos_tags
  end
end
