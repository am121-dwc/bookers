class BooksController < ApplicationController
  def new
    @book = Book.new

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Create book is successfully."
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "Book was not created. Both title and body required."
      redirect_to book
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book change is successfully."
       redirect_to book_path
    else
       flash[:alert] = "Book was not updated. Both title and body required."
       redirect_to book_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Delete Book is successfully."
      redirect_to books_path
    else
      flash.now[:alert] = "book was not destroyed."
      render book_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end