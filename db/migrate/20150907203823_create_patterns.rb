class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name, :null => false
      t.string :company
      t.integer :stars, :default => 0, :null => false
      t.text :review, :limit => 1000000000
      t.string :man_link
    end
  end
end
