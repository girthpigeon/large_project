class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dares = @user.dares.paginate(page: params[:page])
    @accepted_feed = Dare.where(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
