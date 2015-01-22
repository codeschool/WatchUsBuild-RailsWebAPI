class AddGenresFkToBooks < ActiveRecord::Migration
  def change
    add_foreign_key :books, :genres
    add_index :books, :genre_id
  end
end
