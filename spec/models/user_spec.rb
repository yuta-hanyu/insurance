require 'rails_helper'

RSpec.describe User, type: :model do
  context "データが正しく保存される" do
    before do
      @user = User.new
      @user.contractor_name = "終身保険"
      @user.email = "eee@eee.com"
      @user.password_digest = "1234"
      @user.address = "東京"
      @user.save
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
    end
  end
end
