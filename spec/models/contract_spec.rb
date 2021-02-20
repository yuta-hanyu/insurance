require 'rails_helper'
RSpec.describe Contract, "モデルテスト", type: :model do
  describe "保存テスト" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:contract)).to be_valid
    end
    context "空のバリデーションテスト" do
      it "contract_nameがない場合" do
        contract = FactoryBot.build(:contract, contract_name: nil)
        contract.valid?
        expect(contract.errors[:contract_name]).to include("を入力してください")
      end
      it "policy_numberがない場合" do
        contract = FactoryBot.build(:contract, policy_number: nil)
        contract.valid?
        expect(contract.errors[:policy_number]).to include("を入力してください")
      end
      it "policy_numberが10桁以上の場合" do
        contract = FactoryBot.build(:contract, policy_number: "123456789012")
        contract.valid?
        expect(contract.errors[:policy_number]).to include("は10文字以内で入力してください")
      end
    end 
  end
end
