class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.tests_in_category(category)
    Category.where("categories.title = ?", category).first
      .tests
      .order(id: :desc)
      .pluck(:title)
  end
end
