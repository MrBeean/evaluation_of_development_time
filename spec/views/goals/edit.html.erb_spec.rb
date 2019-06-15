require 'rails_helper'

RSpec.describe "goals/edit", type: :view do
  let(:goal) { create(:visible_goal) }

  context 'without login' do
    it 'renders error without login' do
      visit edit_goal_path(goal)

      expect(page).to have_content('Нужно авторизоваться')
    end
  end

  context 'with login' do
    it "renders the edit goal form" do
      login_as(goal.user, scope: :user)
      visit edit_goal_path(goal)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Изменение цели')
        expect(page).to have_content('Название')
        expect(page).to have_content('Оптимистическая оценка')
        expect(page).to have_content('Номинальная оценка')
        expect(page).to have_content('Пессимистическая оценка')
      end
    end
  end
end
