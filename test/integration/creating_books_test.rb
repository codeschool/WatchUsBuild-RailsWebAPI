require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @genre = Genre.create!(name: 'Fiction')
  end

  test 'creates books with valid data' do
    post '/api/books', { book: book_attributes }.to_json, {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }

    assert_equal 201, response.status
    book = json(response.body)[:book]
    assert_equal api_book_url(book[:id]), response.location
    assert_equal book_attributes[:author], book[:author]
    assert_equal book_attributes[:review], book[:review]
    assert_equal book_attributes[:rating], book[:rating]
    assert_equal book_attributes[:amazon_id], book[:amazon_id]
    assert_equal book_attributes[:genre_id], book[:genre_id]
  end

  test 'does not create book without title' do
    post '/api/books', { book: { title: nil, rating: 1 }}.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end

  def book_attributes
    {
      title: 'Cooking Bananas',
      rating: 3,
      author: 'Chef',
      review: 'Really good',
      amazon_id: 1,
      genre_id: @genre.id
    }
  end
end
