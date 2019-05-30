class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.references :user, foreign_key: true
      t.string  :title
      t.float :optimal_days
      t.float :normal_days
      t.float :pessimistic_days
      t.float :expected_days
      t.float :deviation_days

      t.timestamps
    end
  end
end
