require 'rails_helper'

RSpec.describe Claim, "モデルテスト", type: :model do
  describe "保存テスト" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:claim)).to be_valid
    end
    context "空のバリデーションテスト" do
      it "patientがない場合" do
        claim = FactoryBot.build(:claim, patient: nil)
        claim.valid?
        expect(claim.errors[:patient]).to include("を入力してください")
      end
      it "policy_numberがない場合" do
        claim = FactoryBot.build(:claim, policy_number: nil)
        claim.valid?
        expect(claim.errors[:policy_number]).to include("を入力してください")
      end
      it "hospital_stayがない場合" do
        claim = FactoryBot.build(:claim, hospital_stay: nil)
        claim.valid?
        expect(claim.errors[:hospital_stay]).to include("を入力してください")
      end
      it "account_numberがない場合" do
        claim = FactoryBot.build(:claim, account_number: nil)
        claim.valid?
        expect(claim.errors[:account_number]).to include("を入力してください")
      end
      it "account_numberが10桁以上の場合" do
        claim = FactoryBot.build(:claim, account_number: "12345898030303")
        claim.valid?
        expect(claim.errors[:account_number]).to include("は10文字以内で入力してください")
      end
      it "receipt_img_idがないの場合" do
        claim = FactoryBot.build(:claim, receipt_img: nil)
        claim.valid?
        expect(claim.errors[:receipt_img]).to include("を入力してください")
      end
      it "destinationがない場合" do
        claim = FactoryBot.build(:claim, destination: nil)
        claim.valid?
        expect(claim.errors[:destination]).to include("を入力してください")
      end
      it "illnessがない場合" do
        claim = FactoryBot.build(:claim, illness: nil)
        claim.valid?
        expect(claim.errors[:illness]).to include("を入力してください")
      end
    end 
  end
end