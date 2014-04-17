class FinishedBooksController < ApplicationController
  respond_to :xml, :json

  def index
    finished_books = Book.finished
    respond_with(finished_books, status: 200)
  end
end
