require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  test 'creates books with valid data' do
    post '/books', {
      book: {
        title: 'Cooking Bananas',
        rating: 3
      }
    }.to_json, {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }

    assert_equal 201, response.status
    book = json(response.body)
    assert_equal book_url(book[:id]), response.location
  end

  test 'does not create book without title' do
    post '/books', { book: { title: nil, rating: 1 }}.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end
end
