class Feedback
  include ActiveModel::Validations

  attr_accessor :subject, :email, :body
  validates :subject, :email, :body, presence: true

  def initialize(attributes = {})
    @subject = attributes[:subject]
    @email = attributes[:email]
    @body = attributes[:body]
  end
end
