# Preview all emails at http://localhost:3000/rails/mailers/books
class BooksPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/books/new_review
  def new_review
    Books.new_review(Book.last)
  end

end
