class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids
  has_many :books
end
