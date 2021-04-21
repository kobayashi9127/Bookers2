class UsersController < ApplicationController
def index
  @user = current_user
  @users = User.all
end

def edit
  @user = User.find(params[:id])
end

def show
  @user = User.find(params[:id])
  @book = @user.books
  @book_new = Book
end

def update
end

end
