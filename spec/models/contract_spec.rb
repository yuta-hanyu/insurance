require 'rails_helper'
# belongs_to :userをコメントアウトの上、テスト実行！
RSpec.describe Contract, type: :model do
  context "データが正しく保存される" do
    before do
      @contract = Contract.new
      @contract.contract_name = "終身保険"
      @contract.policy_number = "1234"
      @contract = build(:contract, user_id: user.id, group_id: group.id)
      @contract.save
    end
    it "全て入力してあるので保存される" do
      expect(@contract).to be_valid
    end
  end
end
