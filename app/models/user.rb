class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  has_many :created_tests, class_name: "Test"

  validates :email, presence: true

  # scope :list_test_user, -> (options) do
  #   options[:self].tests.where(level: options[:level])
  # end
  #
  # def list_test_user(level)
  #   self.class.list_test_user(level: level, self: self)
  # end

  def list_test_user(level)
    tests.where(level: level)
  end
end
