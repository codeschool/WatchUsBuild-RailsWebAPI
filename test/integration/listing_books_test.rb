require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @tech_genre = Genre.create!(name: 'Tech')

    @tech_genre.books.create!(title: 'Pragmatic Programmer',
                             author: 'Jon', review: 'Good!',
                             rating: 5, amazon_id: '123123')
    @tech_genre.books.create!(title: 'Pickaxe', rating: 5)
    @tech_genre.books.create!(title: 'ASP.NET for Dummies', rating: 2)

    Book.create!(title: 'Pascal', rating: 2, archived_at: 10.years.ago)
  end

  test 'lists all books not archived' do
    get '/api/books'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    books = json(response.body)[:books]
    assert_equal 3, books.size

    assert_equal @tech_genre.id, books.first[:genre_id]
  end

  test 'lists top rated books' do
    get '/api/books?rating=5'

    books = json(response.body)[:books]
    assert_equal 2, books.size

    titles = books.map { |b| b[:title] }
    assert_includes titles, 'Pragmatic Programmer'
    refute_includes titles, 'ASP.NET for Dummies'
  end

end
