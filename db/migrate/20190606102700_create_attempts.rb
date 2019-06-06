class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.belongs_to :test, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
