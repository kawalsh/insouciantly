class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.integer :blog_id
    	t.integer :stars, :null => false, :defaul => 0
    	t.string :title, :null => false
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.string :goodreads_link
    end
  end
end
