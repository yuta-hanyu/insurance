class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
    
  def require_user_logged_in
    unless logged_in?
      redirect_to "/"
    end
  end
  
  def guest_user
    @user = User.find_by(email: 'guest@example.com')
    if @user == current_user
        flash[:danger] = 'ゲストユーザーは契約者情報の編集・退会が出来ません'
        redirect_to user_path
    end
  end
  
  def admin_user
    @admin = User.find_by(email: 'admin@admin.com')
    if @admin == current_user
        flash[:danger] = 'ポートフォリオ用に管理者情報の編集操作をとめています'
        redirect_to user_path
    end
  end
  
end
