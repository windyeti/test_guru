module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |user| user.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  def password=(string)
    if string.nil?
      self.password_digest = nil
    else
      @password = string
      self.password_digest = digest(string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
