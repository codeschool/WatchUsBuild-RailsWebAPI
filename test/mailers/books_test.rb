require 'test_helper'

class BooksTest < ActionMailer::TestCase
  test "new_review" do
    mail = Books.new_review
    assert_equal "New review", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
