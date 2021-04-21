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
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user.id)
end

private

def user_params
    params.require(:user).permit(:name, :profile_image)
end
end
