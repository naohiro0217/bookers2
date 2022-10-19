class UsersController < ApplicationController
  def show
   @users = User.find(params[:id]), User.all
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
      if @user == current_user
            render :edit
      else
            redirect_to user_path(current_user.id)
      end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
