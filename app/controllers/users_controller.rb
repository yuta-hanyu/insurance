class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:show,:edit,:edit_confirm,:update,:destroy]
  before_action :guest_user,only: [:edit,:update,:destroy]
  before_action :correct_user, only: [:show,:destroy,:edit, :edit_confirm, :update]
  
  def show
    @user = User.find_by(id: params[:id])
    @claims =  current_user.claims.order(id: :desc).page(params[:page]).per(2)
  end

  def new
    @user = User.new
  end
  
  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'ご契約者情報の登録が完了しました'
      render :js => "window.location = '/'"
    else
      @msgs = @user.errors.full_messages.join(" , ")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def edit_confirm
    @user = User.find_by(id: params[:id])
    @user.attributes = user_params
    render :edit if @user.invalid?
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    flash[:success] = '登録内容の変更が完了しました。'
    redirect_to @user
  end
  
  def destroy
    @user = User.find_by(id: params[:id]) 
    @user.destroy
    flash[:success] = '退会が完了しました。'
    redirect_to "/"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:contractor_name, :email, :address, :password)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to root_url(current_user.id)
    end
  end
  
end
