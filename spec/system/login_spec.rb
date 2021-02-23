require 'rails_helper'

RSpec.describe "ログインテスト", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  it 'ログイン画面が表示されること' do
    visit root_path
    expect(page).to have_content('ログイン')
  end
  it 'ゲストログインテスト' do
    visit root_path
    expect(page).to have_content('ゲストログイン')
    click_on 'ゲストログイン'
    expect(page).to have_content 'ゲストユーザーとしてログインしました'
  end
  it 'ユーザーログインテスト' do
    visit root_path
    expect(page).to have_content('ユーザーログイン')
    fill_in "user[email]", with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'ユーザーログイン'
    expect(page).to have_content 'ログアウト'
  end
  it 'ユーザーログインテスト失敗', js: true do
    visit root_path
    expect(page).to have_content('ユーザーログイン')
    fill_in "user[email]", with: ""
    fill_in 'user[password]', with: @user.password
    click_on 'ユーザーログイン'
    expect(page).to have_content 'ログアウト'
  end
end
