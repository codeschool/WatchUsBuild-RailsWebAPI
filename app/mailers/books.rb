class Books < ApplicationMailer

  def new_review(book)
    @book = book

    mail to: 'carlos@codeschool.com', subject: "New Review #{@book.title}"
  end
end
