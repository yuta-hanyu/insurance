class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
  @posts = current_user.likeings.order(id: :desc).page(params[:page]).per(2)
  end
  
  def create
    post = Post.find_by(id: params[:post_id])
    current_user.like(post)
    flash[:success] = 'お気に入り登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find_by(id: params[:post_id])
    current_user.unlike(post)
    flash[:warning] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
