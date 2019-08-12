class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :tests_beginer, -> { where(level: 0..1) }
  scope :tests_middle, -> { where(level: 2..4) }
  scope :tests_master, -> { where(level: 5..Float::INFINITY) }
  scope :with_category, -> (category) { joins(:category)
                                        .where(categories: { title: category })
                                        .order(id: :desc) }
  def self.titles_category(category)
    with_category(category).pluck(:title)
  end

  def self.ids_test_category(category)
    with_category(category).unscope(:order).pluck(:id)
  end

  validates :title, presence: true
  validates :level, numericality: { greater_than: 0, only_integer: true }
  validates :title, uniqueness: { scope: :level }
end
