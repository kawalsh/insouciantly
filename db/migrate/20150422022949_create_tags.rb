class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string :tag
    	t.string :tag_type
    end

    create_table :blog_tags do |t|
    	t.integer :blog_id
    	t.integer :tag_id
    end

    create_table :project_tags do |t|
    	t.integer :project_id
    	t.integer :tag_id
    end

    create_table :photo_tags do |t|
    	t.integer :photo_id
    	t.integer :tag_id
    end
  end
end
