require 'rails_helper'

RSpec.describe "goals/show", type: :view do
  let(:goal) { create(:visible_goal) }

  context 'without login' do
    it 'renders error without login' do
      visit goal_path(goal)

      expect(page).to have_content('Нужно авторизоваться')
    end
  end

  context 'with login' do
    it "renders the edit goal form" do
      login_as(goal.user, scope: :user)
      visit goal_path(goal)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Используй в разговоре с руководителем:')
        expect(page).to have_content(goal.title)
        expect(page).to have_content(goal.optimal_days)
        expect(page).to have_content(goal.normal_days)
        expect(page).to have_content(goal.pessimistic_days)
        expect(page).to have_content(goal.expected_days)
        expect(page).to have_content(goal.deviation_days)
      end
    end
  end
end
