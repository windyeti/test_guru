class FeedBacksMailer < ApplicationMailer
  default from: "Test_Guru"
  layout "feedback_mailer"

  def feedback_message(message, user)
    @subject = message[:subject]
    @body = message[:body]

    mail to: 'yegor.tikhanin@gmail.com', subject: t('feed_backs_mailer.subject', subject: "#{@subject}", email: "#{user.email}")
  end
end
