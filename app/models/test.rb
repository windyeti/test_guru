class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :tests_beginer, -> { where(level: 0..1) }
  scope :tests_middle, -> { where(level: 2..4) }
  scope :tests_master, -> { where(level: 5..Float::INFINITY) }
  scope :tests_in_category, -> (category) { joins(:category)
                                            .where(categories: {title: category})
                                            .order(id: :desc)
                                            .pluck(:title) }

  validates :title, presence: true
  validates :level, numericality: { greater_than: 0, only_integer: true }
  validate :validate_uniq_title_level

  def validate_uniq_title_level
    errors.add(:uniq_title_level, "Pair title_level must be uniqueness!") if Test.exists?(title: title, level: level)
  end
end
