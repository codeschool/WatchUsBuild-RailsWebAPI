require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'Pragmatic Programmer', rating: 5)
    Book.create!(title: 'ASP.NET for Dummies', rating: 2)
  end

  test 'lists all books' do
    get '/books'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 2, JSON.parse(response.body).size
  end
end
