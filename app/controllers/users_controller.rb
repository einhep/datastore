# coding: utf-8
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the datastore website"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update_attributes(user_params)
    #更新成功
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  #事前过滤器
  def logged_in_user
    unless logged_in?
      flash[:danger] = "please log in first"
      redirect_to login_url
    end
  end
end
