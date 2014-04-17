class AddReadingFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author, :string
    add_column :books, :review, :text
    add_column :books, :amazon_id, :string
    add_column :books, :genre_id, :integer, index: true
  end
end
