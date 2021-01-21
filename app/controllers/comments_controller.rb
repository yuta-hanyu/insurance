class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :if_not_admin
  
  def index
    @contacts = Contact.order(id: :desc).page(params[:page]).per(2)
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
  end
  
  private
 
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
