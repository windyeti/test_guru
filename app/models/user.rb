class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  has_many :created_tests, class_name: "Test"

  def list_test_user(level)
    tests.where("tests.level = ?", level)
  end
end
