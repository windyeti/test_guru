class User < ApplicationRecord
  def list_test_user(level)
    Test
      .joins("JOIN test_users ON test_users.test_id = tests.id")
      .where("tests.level = ? AND test_users.user_id = ?", level, self.id)
  end
end
