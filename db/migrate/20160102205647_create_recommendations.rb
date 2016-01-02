class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :title, :null => false
      t.string :author, :null => false
      t.string :recommender, :null => false
      t.integer :book_id
      t.string :status, :null => false, :default => "pending"
      t.text :comment, :limit => 1000000000
      t.timestamps
    end
  end
end
