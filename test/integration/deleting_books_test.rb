require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create!(title: 'Bananas')
  end

  test 'destroying books does not delete' do
    delete "/api/books/#{@book.id}"
    assert_equal 204, response.status
    assert @book.reload
  end
end
