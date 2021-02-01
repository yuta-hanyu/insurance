class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @posts = current_user.likeings.order(id: :desc).page(params[:page]).per(2)
  end
  
  def create
    post = Post.find_by(id: params[:post_id])
    current_user.like(post)
    # create.jsへIDを渡す
    @post = Post.find(params[:post_id])
    @msg = "お気に入り登録しました"
  end

  def destroy
    post = Post.find_by(id: params[:post_id])
    current_user.unlike(post)
    # destoy.jsへIDを渡す
    @post = Post.find(params[:post_id])
    @msg = "削除しました"
  end
end
