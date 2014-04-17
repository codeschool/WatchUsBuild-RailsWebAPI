module Api
  class FinishedBooksController < ApplicationController
    def index
      finished_books = Book.finished
      respond_to do |format|
        format.json { render json: finished_books, each_serializer: ::BookSerializer, status: 200 }
        format.xml { render xml: finished_books, each_serializer: ::BookSerializer, status: 200 }
      end
    end
  end
end
