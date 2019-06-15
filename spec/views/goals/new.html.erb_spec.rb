require 'rails_helper'

RSpec.describe "goals/new", type: :view do
  let(:user) { create(:user) }

  context 'without login' do
    it 'renders error without login' do
      visit new_goal_path

      expect(page).to have_content('Нужно авторизоваться')
    end
  end

  context 'with login' do
    it "renders the edit goal form" do
      login_as(user, scope: :user)
      visit new_goal_path

      aggregate_failures 'expected result' do
        expect(page).to have_content('Внеси свои оценки:')
        expect(page).to have_content('Название')
        expect(page).to have_content('Оптимистическая оценка')
        expect(page).to have_content('Номинальная оценка')
        expect(page).to have_content('Пессимистическая оценка')
      end
    end
  end
end
