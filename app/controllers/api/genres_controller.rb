module Api
  class GenresController < ApplicationController
    def index
      render json: Genre.all, status: 200
    end
  end
end
