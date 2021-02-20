require 'rails_helper'

RSpec.describe User, "モデルテスト", type: :model do
  describe "保存テスト" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
    context "空のバリデーションテスト" do
      it "contractor_namがない場合" do
        user = FactoryBot.build(:user, contractor_name: nil)
        user.valid?
        expect(user.errors[:contractor_name]).to include("を入力してください")
      end
      it "emailがない場合" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      it "emailが重複する場合" do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.build(:user, email: user1.email)
        user2.valid?
        expect(user2.errors[:email]).to include("はすでに存在します")
      end
      it "addressがない場合" do
        user = FactoryBot.build(:user, address: nil)
        user.valid?
        expect(user.errors[:address]).to include("を入力してください")
      end
    end 
  end
end
