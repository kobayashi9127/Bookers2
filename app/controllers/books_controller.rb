class BooksController < ApplicationController

  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
   @users = User.all
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to book_path(@book)

  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
  end

  def edit
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path(@book)
  end

  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end
