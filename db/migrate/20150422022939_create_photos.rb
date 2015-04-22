class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :filename, :null => false
    	t.integer :blog_id
    	t.integer :project_id
    	t.boolean :fizz, :null => false, :default => false
    end
  end
end
