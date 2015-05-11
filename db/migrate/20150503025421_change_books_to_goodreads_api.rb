class ChangeBooksToGoodreadsApi < ActiveRecord::Migration
  def change
    remove_column :books, :title
    remove_column :books, :first_name
    remove_column :books, :last_name
    remove_column :books, :goodreads_link
    remove_column :books, :gr_html
    add_column :books, :gr_id, :integer
  end
end
