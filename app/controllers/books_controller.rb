class BooksController < ApplicationController

  def index
   @book = Book.new
   @books = Book.all
   @user = User.find(params[:id])
   @post_images = @user.books.(params[:id])
  end

  def create
   @book = Book.new(book_params)
   @book.save
   redirect_to book(book.id)
    
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end
