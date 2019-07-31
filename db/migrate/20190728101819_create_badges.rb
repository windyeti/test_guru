class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :rule_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
