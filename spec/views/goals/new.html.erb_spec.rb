require 'rails_helper'

RSpec.describe "goals/new", type: :view do
  before(:each) do
    assign(:goal, Goal.new(
      :user => nil,
      :title => "",
      :optimal_days => 1,
      :normal_days => 1,
      :pessimistic_days => 1,
      :expected_days => 1,
      :deviation_days => 1
    ))
  end

  it "renders new goal form" do
    render

    assert_select "form[action=?][method=?]", goals_path, "post" do

      assert_select "input[name=?]", "goal[user_id]"

      assert_select "input[name=?]", "goal[title]"

      assert_select "input[name=?]", "goal[optimal_days]"

      assert_select "input[name=?]", "goal[normal_days]"

      assert_select "input[name=?]", "goal[pessimistic_days]"

      assert_select "input[name=?]", "goal[expected_days]"

      assert_select "input[name=?]", "goal[deviation_days]"
    end
  end
end
