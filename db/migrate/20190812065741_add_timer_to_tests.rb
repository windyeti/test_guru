class AddTimerToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer, default: 60, null: false
  end
end
