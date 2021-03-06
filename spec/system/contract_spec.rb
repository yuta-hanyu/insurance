require 'rails_helper'

RSpec.describe "契約登録テスト", type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit root_path
    expect(page).to have_content('ユーザーログイン')
    fill_in "user[email]", with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'ユーザーログイン'
    expect(page).to have_content 'ログアウト'
    visit contracts_path(@user.id)
  end
  
  context '新規契約登録' do
    it '新規登録画面があるか' do
      expect(page).to have_content('ご登録済みの契約一覧')
    end
    # it '新規登録できるか' do
    #   visit contracts_path
    #   expect(page).to have_content('新規登録')
    #   fill_in "user[contractor_name]", with: @user.contractor_name
    #   fill_in "user[email]", with: @user.email
    #   click_on '登録'
    #   expect(page).to have_content 'ご契約情報の登録が完了しました'
    # end
    # it '新規登録失敗か' do
    #   visit root_path
    #   expect(page).to have_content('新規登録')
    #   fill_in "user[contractor_name]", with: ""
    #   fill_in "user[email]", with: @user.email
    #   fill_in "user[password]", with: @user.password
    #   fill_in "user[password_confirmation]", with: @user.email
    #   fill_in 'user[address]', with: @user.address
    #   click_on '登録'
    #   expect(page).to have_content '契約者名を入力してください'
    # end
  end
#  context '編集可能か' do
#     it '編集画面があるか' do
#       visit user_path(@new_user.id)
#       expect(page).to have_content('メールアドレス')
#     end
#     it '編集可能か' do
#       visit user_path(@new_user.id)
#       expect(page).to have_content('メールアドレス')
#       fill_in "user[contractor_name]", with: "たけし"
#       fill_in "user[email]", with: @user.email
#       fill_in "user[password]", with: @user.password
#       fill_in "user[password_confirmation]", with: @user.email
#       fill_in 'user[address]', with: @user.address
#       click_on '登録'
#       expect(page).to have_content 'ご契約情報の登録が完了しました'
#     end
#     it '退会できるか' do
#       visit "/users/delete/confirm/#{@new_user.id}"
#       expect(page).to have_content('退会のご確認')
#       expect{ @new_user.destroy }.to change{ User.count }.by(-1)
#     end
#  end
end