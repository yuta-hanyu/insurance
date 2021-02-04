class ContractsController < ApplicationController
  
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy,:edit, :edit_confirm, :update]
  
  def index
    @contracts = current_user.contracts.order(id: :desc).page(params[:page]).per(30)
    @contract = current_user.contracts.build
  end

  def create
    @contract = current_user.contracts.build(contract_params)
    @contract.save(contract_params)
    @msg = 'ご契約の新規登録が完了しました'
    @contracts = current_user.contracts.order(id: :desc)
  end

  def edit
    @contract = current_user.contracts.find(params[:id])
  end
  
  def edit_confirm
    @contract = current_user.contracts.find(params[:id])
    @contract.attributes = contract_params
    render :edit if @contract.invalid?
  end

  def update
    @contract = current_user.contracts.find(params[:id])
    @contract.update(contract_params)
    flash[:success] = 'ご契約の登録内容の変更が完了しました。'
    redirect_to contracts_path(current_user.id)
  end
  
  def destroy_confirm
    @contract = current_user.contracts.find(params[:id])
  end

  def destroy
    @contract = current_user.contracts.find(params[:id])
    @contract.destroy
    flash[:success] = 'ご契約の登録を削除しました。'
    redirect_to contracts_path
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
