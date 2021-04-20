class UsersController < ApplicationController
def index
  @user = User.find(params[:id])
  @book = @user.books.all
end

def edit
  @user = User.find(params[:id])
end

def show
  @user = User.find(params[:id])
  @book = @user.book
end

def update
end

end
