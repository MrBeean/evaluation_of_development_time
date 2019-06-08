class AddColumnsToGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :fact_days, :float
    add_column :goals, :visibility, :boolean, default: false
  end
end
