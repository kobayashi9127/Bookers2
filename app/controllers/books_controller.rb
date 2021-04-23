class BooksController < ApplicationController

  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
   @users = User.all
   @user_books = @book.user
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
   flash[:notice] = 'Book was successfully created.'
   redirect_to book_path(@book)
   else
   @books = Book.all
   render :new
   end
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  private
  def book_params
  params.require(:book).permit(:title, :body)
  end

end
