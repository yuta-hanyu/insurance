require 'rails_helper'

RSpec.describe Comment, "モデルテスト", type: :model do
  describe "保存テスト" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:comment)).to be_valid
    end
    context "空のバリデーションテスト" do
      it "contentがない場合" do
        comment = FactoryBot.build(:comment, content: nil)
        comment.valid?
        expect(comment.errors[:content]).to include("を入力してください")
      end
      it "contentが301桁以上の場合" do
        comment = FactoryBot.build(:comment, content: "a" * 301)
        comment.valid?
        expect(comment.errors[:content]).to include("は300文字以内で入力してください")
      end
    end 
  end
end
