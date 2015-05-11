class AddCreditsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :credits, :string, :default => ""
  end
end
