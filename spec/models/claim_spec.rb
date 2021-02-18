require 'rails_helper'

RSpec.describe Claim, type: :model do
  context "データが正しく保存される" do
    before do
      @claim = Claim.new
      @claim.patient = "ひろし"
      @claim.policy_number = "ひろし"
      @claim.hospital_stay = "2020/02/02"
      @claim.account_number = 1212121
      @claim.receipt_img = "121212"
      @claim.destination = "日吉"
      @claim.illness = "かぜ"
      @claim.save
    end
    it "全て入力してあるので保存される" do
      expect(@claim).to be_valid
    end
  end
end
