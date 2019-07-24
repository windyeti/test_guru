module TestsHelper
  def current_test(test, test_chore)
    (test_chore.present?) && (test_chore.id == test.id) ? test_chore : test
  end
end
