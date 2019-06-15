require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  let!(:goal) { create(:visible_goal) }

  context 'without login' do
    it 'renders error without login' do
      visit goals_path

      expect(page).to have_content('Нужно авторизоваться')
    end
  end

  context 'with login' do
    it "renders a list of goals" do
      login_as(goal.user, scope: :user)
      visit goals_path

      aggregate_failures 'expected result' do
        expect(page).to have_content(goal.title)
        expect(page).to have_content(goal.expected_days)
        expect(page).to have_content(goal.deviation_days)
      end
    end
  end
end
