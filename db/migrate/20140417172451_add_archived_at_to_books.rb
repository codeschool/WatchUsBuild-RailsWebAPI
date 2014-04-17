class AddArchivedAtToBooks < ActiveRecord::Migration
  def change
    add_column :books, :archived_at, :datetime
  end
end
