class Badge < ApplicationRecord
  has_many :badge_users
  has_many :users, through: :badge_users

  validates :rule, :image, presence: true
  validates :rule, uniqueness: { scope: :rule_value}

  validate :rule_correct, on: :create

  def rule_correct
    errors.add(:rule_correct, I18n.t('admin.badge.errors')) if BadgesHelper::RULE_TITLE.map { |key| key == rule }.empty?
  end

end
