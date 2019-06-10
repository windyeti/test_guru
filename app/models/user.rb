class User < ApplicationRecord
  has_many :tests_users, dependent: :delete_all
  has_many :tests, through: :tests_users

  has_many :author, :class_name => "Test"

  def list_test_user(level)
    Test
      .joins("JOIN tests_users ON tests_users.test_id = tests.id")
      .where("tests.level = ? AND tests_users.user_id = ?", level, id)
  end
end
