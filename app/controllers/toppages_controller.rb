class ToppagesController < ApplicationController
  
  def index
    @posts = Post.order(id: :desc)
    @user = User.new
  end

  def show
    @post = Post.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:contractor_name, :email, :address, :password)
  end
  
end
