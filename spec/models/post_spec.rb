require 'rails_helper'

RSpec.describe Post, "モデルテスト", type: :model do
  describe "保存テスト" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post)).to be_valid
    end
    context "空のバリデーションテスト" do
      it "titleがない場合" do
        post = FactoryBot.build(:post, title: nil)
        post.valid?
        expect(post.errors[:title]).to include("を入力してください")
      end
      it "contentがない場合" do
        post = FactoryBot.build(:post, content: nil)
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end
      it "contentが255桁以上の場合" do
        post = FactoryBot.build(:post, content: "a" * 260)
        post.valid?
        expect(post.errors[:content]).to include("は255文字以内で入力してください")
      end
      it "画像がない場合" do
        post = FactoryBot.build(:post, post_img: nil)
        post.valid?
        expect(post.errors[:post_img]).to include("を入力してください")
      end
    end 
  end
end