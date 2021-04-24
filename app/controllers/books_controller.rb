class BooksController < ApplicationController
before_action :authenticate_user!
  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
   flash[:notice] = 'Book was successfully created.'
   redirect_to book_path(@book)
   else
   @books = Book.all
   @user = current_user
   @user_books = @book.user
   render :index
   end
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
       redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = 'Book was successfully update.'
    redirect_to book_path(@book)
    else
    render :edit
    end
  end

  private
  def book_params
  params.require(:book).permit(:title, :body)
  end

end
