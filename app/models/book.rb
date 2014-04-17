class Book < ActiveRecord::Base
  scope :finished, ->{ where('finished_at IS NOT NULL') }
end
