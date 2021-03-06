class ContractsController < ApplicationController
  
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def index
    @contracts = current_user.contracts.order(id: :desc).page(params[:page]).per(3)
    @contract = current_user.contracts.build
  end

  def create
    @contract = current_user.contracts.build(contract_params)
    @contracts = current_user.contracts.order(id: :desc).page(params[:page]).per(3)
    if @contract.save(contract_params)
      @msg = 'ご契約の新規登録が完了しました'
    else 
      @msgs = @contract.errors.full_messages.join("、")
    end
  end

  def update
    @contract = current_user.contracts.find(params[:id])
    @contracts = current_user.contracts.order(id: :desc).page(params[:page]).per(3)
    if @contract.update(contract_params)
      @msg = '変更が完了しました'
    else
      @msgs = @contract.errors.full_messages.join("、")
    end
  end

  def destroy
    @contract = current_user.contracts.find(params[:id])
    @contract.destroy
    @msg = "#{@contract.contract_name}を削除しました"
    @contracts = current_user.contracts.order(id: :desc).page(params[:page]).per(3)
  end
  
  private

  def contract_params
    params.require(:contract).permit(:contract_name,:policy_number)
  end
  
  def correct_user
    @contract = current_user.contracts.find(params[:id])
    unless @contract
      redirect_to root_url(current_user.id)
    end
  end
  
end
