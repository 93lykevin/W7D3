class UsersController < ApplicationController

  def index
    render :index
  end

  def show
    # @user = User.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save!
      render :show
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
    target = User.find(params[:id])
    target.destroy
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end
