require 'csv'
class ClaimsController < ApplicationController
  before_action :require_user_logged_in
  before_action :if_not_admin, only: [:claims_list, :claims_list_show ,:destroy]
  
  def new
    @claim = current_user.claims.build
    @contracts = current_user.contracts.all
    @claims =  current_user.claims.order(id: :desc).page(params[:page]).per(5)
  end
  
  def create
    @claim = current_user.claims.build(claim_params)
    if @claim.save(claim_params)
      @claims =  current_user.claims.order(id: :desc).page(params[:page]).per(5)
    else
      @msgs = @claim.errors.full_messages.join("、")
      @claims =  current_user.claims.order(id: :desc).page(params[:page]).per(5)
    end
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
  
  def destroy
    @claim =  Claim.find(params[:id])
    @claim.destroy
    @msg = "請求ID#{@claim.id}を削除しました"
  end
  
  private

  def claim_params
    params.require(:claim).permit(:Discharge,:patient,:policy_number,:hospital_stay,:account_number,:receipt_img, :destination,:illness)
  end
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
end
