class Genre < ActiveRecord::Base
  has_many :books, dependent: :destroy
end
