class Book < ActiveRecord::Base
  belongs_to :genre

  scope :finished, ->{ where('finished_at IS NOT NULL') }
  scope :available, -> { where(archived_at: nil) }

  validates :title, presence: true

  def archive
    self.archived_at = Time.now
    self.save
  end
end
