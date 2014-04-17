require 'test_helper'

class ListingGenresTest < ActionDispatch::IntegrationTest
  test 'lists all genres' do
    get '/api/genres'
    assert_equal 200, response.status
  end
end
