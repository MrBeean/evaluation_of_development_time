require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  before(:each) do
    assign(:goals, [
      Goal.create!(
        :user => nil,
        :title => "",
        :optimal_days => 2,
        :normal_days => 3,
        :pessimistic_days => 4,
        :expected_days => 5,
        :deviation_days => 6
      ),
      Goal.create!(
        :user => nil,
        :title => "",
        :optimal_days => 2,
        :normal_days => 3,
        :pessimistic_days => 4,
        :expected_days => 5,
        :deviation_days => 6
      )
    ])
  end

  it "renders a list of goals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
