require 'csv'
class ClaimsController < ApplicationController
  before_action :require_user_logged_in
  before_action :if_not_admin, only: [:claims_list, :claims_list_show ,:destroy]
  before_action :correct_user, only: [:show]
  
  def new
    @claim = current_user.claims.build
    @contracts = current_user.contracts.all
    @claims =  current_user.claims.order(id: :desc).page(params[:page]).per(2)
  end
  
  def show
    @claim = Claim.find(params[:id])
  end
  
  def confirm
    @claim = current_user.claims.build(claim_params)
    if @claim.invalid?(:confirm)
      render :new
    end
  end
  
  def create
    @claim = current_user.claims.build(claim_params)
    if @claim.save(claim_params)
    elsif 
      params[:back]
      render :new
    elsif
      render :confirm
    end
  end

  def complete
  end
  
  def claims_list
    @claims = Claim.all.order(id: :desc).page(params[:page]).per(5)
    
    respond_to do |format|
    format.html
    format.csv do |csv|
    send_claims_csv(@claims)
      end
    end
  end
  
  def send_claims_csv(claims)
    csv_data = CSV.generate do |csv|
      header = %w(ID 契約者 患者名 保険証書番号 傷病名 入院日 振込口座 通知書送付先 領収書)
      csv << header

      claims.each do |claim|
        values = [claim.id, claim.user.contractor_name, claim.patient, claim.policy_number, claim.illness, claim.hospital_stay, claim.account_number, claim.destination, claim.receipt_img]
        csv << values
      end

    end
    send_data(csv_data, filename: "claims.csv")
  end
  
  def claims_list_show
    @claim = Claim.find(params[:id])
  end
  
  def destroy
    @claim =  Claim.find(params[:id])
    @claim.destroy
    flash[:success] = '請求は正常に削除されました。'
    redirect_to claims_list_path
  end
  
  private

  def claim_params
    params.require(:claim).permit(:Discharge,:patient,:policy_number,:hospital_stay,:account_number,:receipt_img, :destination,:illness)
  end
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def correct_user
    @claim = current_user.claims.find_by(id: params[:id])
    unless @claim
      redirect_to root_url(current_user.id)
    end
  end
  
end
