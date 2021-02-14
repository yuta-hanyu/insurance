class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :if_not_admin, only: [:index]
  # admin以外はユーザー認証必須とする
  before_action :correct_user, if: proc{ current_user.email != "admin@admin.com" } 
  
  def index
    @contacts = Contact.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @contact = Contact.find(params[:id])
    @comment = @contact.comments.build
    @comment.user_id = current_user.id
    @comments = @contact.comments.order(id: :desc).page(params[:page]).per(3)
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @comment = @contact.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comments = @contact.comments.order(id: :desc).page(params[:page]).per(3)
    if @comment.save
      @msg = "返信しました"
    else
      @msgs = @comment.errors.full_messages.join("、")
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    @msg = "#{@comment.created_at.to_s(:datetime_jp)}に送信した返信を削除しました"
  end
  
  private
 
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def correct_user
    @contact = current_user.contacts.find_by(id: params[:id])
    if @contact
    else
    redirect_to "/"
    end
  end
  
end
