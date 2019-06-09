class User < ApplicationRecord
  def list_test_user(level)
    Test
      .joins("JOIN tests_users ON tests_users.test_id = tests.id")
      .where("tests.level = ? AND tests_users.user_id = ?", level, id)
  end
end
