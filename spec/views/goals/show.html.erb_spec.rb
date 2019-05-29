require 'rails_helper'

RSpec.describe "goals/show", type: :view do
  before(:each) do
    @goal = assign(:goal, Goal.create!(
      :user => nil,
      :title => "",
      :optimal_days => 2,
      :normal_days => 3,
      :pessimistic_days => 4,
      :expected_days => 5,
      :deviation_days => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
