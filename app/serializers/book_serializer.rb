class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :review, :rating, :genre_id, :amazon_id
end
