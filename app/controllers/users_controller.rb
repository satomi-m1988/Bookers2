class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:edit, :show, :index]

  def new
  	@user_image = User.new
    @book = Book.new
  end

  def create
  	@user = User.new(user_params)
    book = Book.new
  	if @user.save
    redirect_to user_path(@user), notice: 'Signed in successfully.'
    else
    render "devise/sessions/new", notice: 'error'
    end
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user.id)
  end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render :edit, notice: 'error'
    end
  end

  def show
  	@user = User.find(params[:id])
  	@book_new = Book.new
  	@books = Book.where(user_id:current_user.id)
  end

  def index
  	@users = User.all
    @book = Book.new
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

