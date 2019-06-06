class Test < ApplicationRecord
  has_many :attempts
  has_many :users, through: :attempts

  def self.test_in_category(category)
    category = Category.find_by_title(category)
    Test.where('category_id == ?', category.id).order(:desc).pluck(:title)
  end
end
