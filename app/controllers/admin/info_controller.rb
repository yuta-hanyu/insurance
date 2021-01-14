class Admin::InfoController < ApplicationController
  before_action :if_not_admin
  before_action :admin_user,only: [:edit,:update]
  
  def show
    @admin = User.find_by(id: params[:id])
  end

  def edit
    @admin = User.find_by(id: params[:id])
  end

  def edit_confirm
    @admin = User.find_by(id: params[:id])
    @admin.attributes = admin_params
    render :edit if @admin.invalid?
  end
  
  def update
    @admin = User.find_by(id: params[:id])
    @admin.update(admin_params)
    flash[:success] = '登録内容の変更が完了しました。'
    redirect_to admin_info_path
  end
  
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def admin_params
    params.require(:user).permit(:contractor_name, :email, :address, :password)
  end
  
end
