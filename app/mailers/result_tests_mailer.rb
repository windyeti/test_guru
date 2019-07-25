class ResultTestsMailer < ApplicationMailer

  layout 'good'

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: t('.result_tests_mailer.subject', title: "#{@test.title}")
  end
end
