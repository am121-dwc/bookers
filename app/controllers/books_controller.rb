class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def create
    book = Book.new(list_params)
    book.save
    redirect_to '/'
  end

  def update
  end

  def destroy
  end

  private
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
