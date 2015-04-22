class Projects < ActiveRecord::Migration
  def change
  	create_table :projects do |t|
    	t.string :name, :null => false
    	t.string :short_description
      	t.timestamps
    end
  end
end
