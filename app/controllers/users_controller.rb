class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'New user created'
    else
      flash[:notice] = 'Issue creating user'
      render 'new'
    end
  end

  def index
  end

  def show
    @current_user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
