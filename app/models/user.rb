class User < ApplicationRecord
  # EMAIL_REGEXP = /[0-9a-zA-Z]{3,}@[0-9a-zA-Z]+\.(com|ru){1}/

  # include Auth

  has_secure_password

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :created_tests, class_name: "Test"

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def list_test_user(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
