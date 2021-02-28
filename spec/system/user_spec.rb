require 'rails_helper'

RSpec.describe "新規登録テスト", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @new_user = FactoryBot.create(:user)
  end
  context '新規登録関係' do
    it '新規登録画面があるか' do
      visit root_path
      expect(page).to have_content('新規登録')
    end
    it '新規登録できるか' do
      visit root_path
      expect(page).to have_content('新規登録')
      fill_in "user[contractor_name]", with: @user.contractor_name
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      fill_in "user[password_confirmation]", with: @user.email
      fill_in 'user[address]', with: @user.address
      click_on '登録'
      expect(page).to have_content 'ご契約情報の登録が完了しました'
    end
    it '新規登録失敗か' do
      visit root_path
      expect(page).to have_content('新規登録')
      fill_in "user[contractor_name]", with: ""
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      fill_in "user[password_confirmation]", with: @user.email
      fill_in 'user[address]', with: @user.address
      click_on '登録'
      expect(page).to have_content '契約者名を入力してください'
    end
 end
 context '編集可能か' do
    it '編集画面があるか' do
      visit user_path(@new_user.id)
      expect(page).to have_content('メールアドレス')
    end
    it '編集可能か' do
      visit user_path(@new_user.id)
      expect(page).to have_content('メールアドレス')
      fill_in "user[contractor_name]", with: "たけし"
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      fill_in "user[password_confirmation]", with: @user.email
      fill_in 'user[address]', with: @user.address
      click_on '登録'
      expect(page).to have_content 'ご契約情報の登録が完了しました'
    end
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
end