class User < ApplicationRecord
  has_many :resolved_tests
  has_many :tests, through: resolved_tests

  def list_test_user(level)

  end
end
