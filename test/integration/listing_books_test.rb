require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'Pragmatic Programmer', rating: 5)
    Book.create!(title: 'Pickaxe', rating: 5)
    Book.create!(title: 'ASP.NET for Dummies', rating: 2)

    Book.create!(title: 'Pascal', rating: 2, archived_at: 10.years.ago)
  end

  test 'lists all books not archived' do
    get '/books'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 3, JSON.parse(response.body).size
  end

  test 'lists top rated books' do
    get '/books?rating=5'

    books = json(response.body)
    assert_equal 2, books.size

    titles = books.map { |b| b[:title] }
    assert_includes titles, 'Pragmatic Programmer'
    refute_includes titles, 'ASP.NET for Dummies'
  end
end
