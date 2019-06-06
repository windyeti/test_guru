class User < ApplicationRecord
  has_many :attempts
  has_many :tests, through: :attempts

  def list_test(level)
    self.tests.select { |test| test.level == level }
  end
end
