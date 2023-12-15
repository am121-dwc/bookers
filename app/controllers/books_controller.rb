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
      flash[:notice] = "Book was successfully created."
      # 　　　　　　　　　↓　修正する可能性あり
       redirect_to book_path(book.id)  
    else
      flash.now[:notice] = "Book was not created."
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path
    else
       flash.now[:notice] = "Book was not updated."
        # 　　　　　　↓　修正する可能性あり
       redirect_to book_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      flash.now[:notice] = "book was not destroyed."
       # 　　　　　　　↓　修正する可能性あり
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end