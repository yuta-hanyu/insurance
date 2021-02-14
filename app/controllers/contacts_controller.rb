class ContactsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @contact = current_user.contacts.build
    @contacts = current_user.contacts.order(id: :desc).page(params[:page]).per(4)
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      @contacts = current_user.contacts.order(id: :desc).page(params[:page]).per(4)
    else 
      @msgs = @contact.errors.full_messages.join("、")
      @contacts = current_user.posts.order(id: :desc).page(params[:page]).per(4)
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:id])
    @contact.destroy
    flash[:success] = 'お問い合わせを削除しました。'
    redirect_to contacts_path
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:type,:title,:content,:tel)
  end
  
end
