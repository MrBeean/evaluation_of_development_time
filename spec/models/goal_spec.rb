require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:goal) { FactoryBot.build(:goal) }
  subject { goal }

  it { should be_valid }
  it { should belong_to(:user) }

  describe 'Calculate' do
    before(:each) do
      goal.update(
          optimal_days: 6,
          normal_days: 19,
          pessimistic_days: 34
      )
    end
    it 'expected days' do
      expect(goal.send(:calc_expected_days)).to eql(19.3)
    end

    it 'deviation days' do
      expect(goal.send(:calc_deviation_days)).to eql(4.7)
    end
  end
end
