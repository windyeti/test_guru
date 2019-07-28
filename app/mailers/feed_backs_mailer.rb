class FeedBacksMailer < ApplicationMailer
  default from: "Test_Guru", to: "yegor.tikhanin@gmail.com"
  layout "feedback_mailer"

  def feedback_message(message)
    @subject = message[:subject]
    @email = message[:email]
    @body = message[:body]

    mail subject: t('feed_backs_mailer.subject', subject: "#{@subject}", email: "#{@email}")
  end
end
