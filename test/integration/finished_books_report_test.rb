require 'test_helper'

class FinishedBooksReportTest < ActionDispatch::IntegrationTest
  setup do
    @finished = Book.create!(title: 'PHP', finished_at: 10.years.ago)
    @not_finished = Book.create!(title: 'ASOFAI', finished_at: nil)
  end

  test 'returns list in JSON' do
    get '/finished_books', {}, { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    books = json(response.body)
    titles = books.map { |b| b[:title] }

    assert_includes titles, @finished.title
    refute_includes titles, @not_finished.title
  end

  test 'returns list in XML' do
    get '/finished_books', {}, { 'Accept' => 'application/xml' }

    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type

    books = Hash.from_xml(response.body)['books']
    titles = books.map { |b| b['title'] }

    assert_includes titles, @finished.title
    refute_includes titles, @not_finished.title
  end
end
