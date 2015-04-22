class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string :title, :null => false
    	t.text :body, :limit => 1000000000
    	t.integer :project_id
      	t.timestamps
    end
  end
end
