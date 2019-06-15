require 'rails_helper'

RSpec.describe "Archiving goal", type: :view do
  let(:goal) { create(:visible_goal) }

  it "sets fact day spent" do
    login_as(goal.user, scope: :user)
    visit set_fact_day_goal_path(goal)

    fill_in 'goal_fact_days', with: '1.5'
    click_button 'Сохранить'

    expect(page).to have_content('Цель успешно заархивирована')
    expect(page).not_to have_content(goal.title)
  end
end
