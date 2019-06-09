class Test < ApplicationRecord
  def self.tests_in_category(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where("categories.title = ?", category)
      .order(id: :desc)
      .pluck(:title)
  end
end
