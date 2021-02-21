require 'rails_helper'

RSpec.describe Contact, "モデルテスト", type: :model do
  describe "保存テスト" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:contact)).to be_valid
    end
    context "空のバリデーションテスト" do
      it "typeがない場合" do
        contact = FactoryBot.build(:contact, type: nil)
        contact.valid?
        expect(contact.errors[:type]).to include("を入力してください")
      end
      it "titleがない場合" do
        contact = FactoryBot.build(:contact, title: nil)
        contact.valid?
        expect(contact.errors[:title]).to include("を入力してください")
      end
      it "contentがない場合" do
        contact = FactoryBot.build(:contact, content: nil)
        contact.valid?
        expect(contact.errors[:content]).to include("を入力してください")
      end
      it "contentが501桁以上の場合" do
        contact = FactoryBot.build(:contact, content: "a" * 501)
        contact.valid?
        expect(contact.errors[:content]).to include("は500文字以内で入力してください")
      end
    end 
  end
end