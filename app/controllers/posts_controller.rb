class PostsController < ApplicationController
  before_action :if_not_admin
  before_action :require_user_logged_in
  
  def index
    @posts = current_user.posts.order(id: :desc).page(params[:page]).per(3)
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save(post_params)
       @posts = current_user.posts.order(id: :desc).page(params[:page]).per(3)
    else
       @msgs = @post.errors.full_messages.join("、")
       @posts = current_user.posts.order(id: :desc).page(params[:page]).per(3)
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    @msg = "#{@post.title}に関する投稿を削除しました"
  end
  
  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :post_img)
  end
  
  
end
