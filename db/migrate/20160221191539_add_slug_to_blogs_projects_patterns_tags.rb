class AddSlugToBlogsProjectsPatternsTags < ActiveRecord::Migration
  def change
    add_column :blogs, :slug, :string
    add_column :projects, :slug, :string
    add_column :patterns, :slug, :string
    add_column :tags, :slug, :string
    add_index :blogs, :slug
    add_index :projects, :slug
    add_index :patterns, :slug
    add_index :tags, :slug
  end
end
