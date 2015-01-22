module Api
  class BooksController < ApplicationController
    def index
      books = Book.available
      if rating = params[:rating]
        books = books.where(rating: rating)
      end
      render json: books, status: 200
    end

    def create
      book = Book.new(book_params)
      if book.save
        Books.new_review(book).deliver_later
        render json: book, status: 201, location: [:api, book]
      else
        render json: book.errors, status: 422
      end
    end

    def destroy
      book = Book.find(params[:id])
      book.archive
      head 204
    end

    private
    def book_params
      params.require(:book).permit(:title, :rating,
                                   :author, :review,
                                   :amazon_id, :genre_id)
    end
  end
end
