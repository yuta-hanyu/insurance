class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :if_not_admin
  
  def index
    @contacts = Contact.order(id: :desc).page(params[:page]).per(2)
  end

  def show
    @comment = current_user.comments.build
    @contact = Contact.find(params[:id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to comment_path(contact.id)
    else
     @contact = Contact.find(params[:id])
     render :comment_path
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
