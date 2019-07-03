# Preview all emails at http://localhost:3000/rails/mailers/result_tests_mailer
class ResultTestsMailerPreview < ActionMailer::Preview
  def completed_test
    ResultTestsMailer.completed_test(TestPassage.new(user: User.first, test: Test.first))
  end
end
