class Goal < ApplicationRecord
  belongs_to :user

  validates :optimal_days, :normal_days, :pessimistic_days,
            presence: true,
            numericality: { integer: true, float: true, greater_than: 0 }
  validates :fact_days, presence: true,
            numericality: { integer: true, float: true, greater_than: 0 },
            on: :fact_days_check

  before_save :calc_expected_days, :calc_deviation_days

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
