class Badge < ApplicationRecord
  RULES = %w{all_tests_category first_attempt_ok all_tests_level}
  IMAGES = %w{gold silver bronze}

  has_many :badge_users
  has_many :users, through: :badge_users

  validates :rule, :image, presence: true
  validates :rule, uniqueness: { scope: :rule_value}
  validates :rule, inclusion: { in: RULES }
  validates :image, inclusion: { in: IMAGES }
end
