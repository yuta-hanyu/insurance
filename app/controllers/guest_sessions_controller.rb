class GuestSessionsController < ApplicationController
  
  def create
    user = User.find_by(email: 'guest@example.com')
    session[:user_id] = user.id
    flash[:success] = 'ゲストユーザーとしてログインしました'
    redirect_to "/"
  end
  
  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
  
end
