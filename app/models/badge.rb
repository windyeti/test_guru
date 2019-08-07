class Badge < ApplicationRecord
  RULE_TITLE = [[ I18n.t('admin.badge.all_tests_category'), 'all_tests_category'],
                [ I18n.t('admin.badge.first_attempt_ok'), 'first_attempt_ok'],
                [ I18n.t('admin.badge.all_tests_level'), 'all_tests_level']]

  RULE_IMAGE = %w[gold silver bronze]

  has_many :badge_users
  has_many :users, through: :badge_users

  validates :rule, :image, presence: true
  validates :rule, uniqueness: { scope: :rule_value}

  validate :rule_correct, on: :create

  def rule_correct
    errors.add(:rule_correct, I18n.t('admin.badge.errors')) if RULE_TITLE.map { |item| item.include?(rule) }.empty?
  end

end
