class Goal < ApplicationRecord
  belongs_to :user

  validates :title, :optimal_days, :normal_days,
            :pessimistic_days, :expected_days, :deviation_days, presence: true
  validates :optimal_days, :normal_days,
            :pessimistic_days,
            numericality: { integer: true, float: true, greater_than: 0 }
  before_validation :calc_expected_days, :calc_deviation_days

  private

  def calc_expected_days
    expected_days = (self.optimal_days + self.normal_days * 4 + self.pessimistic_days)/6
    self.expected_days = expected_days.round(1)
  end

  def calc_deviation_days
    deviation_days = (self.pessimistic_days - self.optimal_days)/6
    self.deviation_days = deviation_days.round(1)
  end
end
