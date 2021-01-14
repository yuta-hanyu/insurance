require 'rails_helper'

RSpec.describe Claim, type: :model do
  context "データが正しく保存される" do
    before do
      @claim = Claim.new
      @claim.patient = "ひろし"
      @claim.policy_number = "ひろし"
      @claim.hospital_stay = "ひろし"
      @claim.account_number = "ひろし"
      @claim.receipt_img = "ひろし"
      @claim.destination = "ひろし"
      @claim.illness = "ひろし"
      @claim.descharge = "ひろし"
      @claim.save
    end
    it "全て入力してあるので保存される" do
      expect(@claim).to be_valid
    end
  end
end
