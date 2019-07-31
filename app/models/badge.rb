class Badge < ApplicationRecord
  has_many :badge_users
  has_many :users, through: :badge_users

  validates :rule_id, :image_id, presence: true
  validates :rule_id, uniqueness: true
end
