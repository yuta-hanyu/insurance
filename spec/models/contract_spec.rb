require 'rails_helper'
# belongs_to :userをコメントアウトの上、テスト実行！
RSpec.describe Contract, "モデルテスト", type: :model do
  describe "保存テスト" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:contract)).to be_valid
    end
    
      
  
  end

end
