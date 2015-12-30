# coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    #验证成功 跳转如用户界面
      log_in user
      redirect_to user
    else
      flash[:danger] = "username or password is wrong"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
