class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :rule, null: false
      t.string :rule_value
      t.string :image, null: false

      t.timestamps
    end
  end
end
