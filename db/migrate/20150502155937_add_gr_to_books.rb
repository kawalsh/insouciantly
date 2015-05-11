class AddGrToBooks < ActiveRecord::Migration
  def change
    add_column :books, :gr_html, :text, :default => ""
  end
end
