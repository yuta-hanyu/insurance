class PostsController < ApplicationController
  before_action :if_not_admin
  before_action :require_user_logged_in
  
  def index
    @posts = current_user.posts.order(id: :desc).page(params[:page]).per(4)
    @post = current_user.posts.build
  end
  
  # def new
  # end

  # def confirm
  #   @post = current_user.posts.build(post_params)
  #   if @post.invalid?(:confirm)
  #     render :new
  #   end
  # end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save(post_params)
      @posts = current_user.posts.order(id: :desc).page(params[:page]).per(5)
    else
      exit
    end
  end

  def show
    @post = current_user.posts.find(params[:id])
  end
  
  # def destroy_confirm
  #   @post = current_user.posts.find(params[:id])
  # end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to posts_path
  end
  
  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def post_params
    params.require(:post).permit(:title,:content,:post_img)
  end
  
  
end
