class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :guest_user, :admin_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:show, :destroy,:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @users = User.order(id: :desc)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'ご契約者情報の登録が完了しました'
      render :js => "window.location = '/'"
    else
      @msgs = @user.errors.full_messages.join("、")
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @msg = '変更が完了しました'
    else
      @msgs = @user.errors.full_messages.join("、")
    end
  end
  
  def destroy
    @user = User.find(params[:id]) 
    if @user.destroy
      flash[:success] = '退会が完了しました'
      redirect_to "/"
    else 
      render 
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:contractor_name, :email, :address, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to root_url(current_user.id)
    end
  end
  
end
