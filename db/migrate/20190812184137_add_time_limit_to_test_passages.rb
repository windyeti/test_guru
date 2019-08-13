class AddTimeLimitToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :timer_limit, :integer, null: false, default: 30
    add_column :test_passages, :start_time_passage, :timestamp
  end
end
