class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if @user =  current_user
    else
       redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :inrtoduction, :profile_image)
  end
end
