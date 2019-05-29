class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.references :user, foreign_key: true
      t.string  :title
      t.integer :optimal_days
      t.integer :normal_days
      t.integer :pessimistic_days
      t.integer :expected_days
      t.integer :deviation_days

      t.timestamps
    end
  end
end
