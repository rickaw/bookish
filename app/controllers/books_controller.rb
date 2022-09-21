class BooksController < ApplicationController
  def index
    @books = Book.all
    @copies = Copy.all
  end

  def add
    puts 'Hey'
  end

  def show
    @book = Book.find(params[:id])
  end
end
