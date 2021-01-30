class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :if_not_admin, only: [:index]
  before_action :correct_user, only: [:destroy]
  
  def index
    @contacts = Contact.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @contact = Contact.find(params[:id])
    @comment = @contact.comments.build
    @comment.user_id = current_user.id
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @comment = @contact.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = '返信しました'
      redirect_to comment_path(@contact.id)
    else
      flash[:danger] = '返信できませんでした'
      render :show
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash[:success] = 'お問い合わせを削除しました。'
    redirect_back(fallback_location: comment_path)
  end
  
  private
 
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def correct_user
    @comment = current_user.comments.find(params[:id])
    unless @comment
    redirect_back(fallback_location: comment_path)
    end
  end
  
end