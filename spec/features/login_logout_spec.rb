require 'rails_helper'

RSpec.describe "Routing user", type: :view do
  let(:user) { create(:user) }

  it 'after login' do
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('С возвращением!')
    expect(current_path).to eql(goals_path)
  end

  it 'after logout' do
    login_as(user, scope: :user)
    visit goals_path

    find("a[href='/users/sign_out']").click
    expect(page).to have_content('До скорой встречи')
    expect(current_path).to eql(root_path)
  end
end
