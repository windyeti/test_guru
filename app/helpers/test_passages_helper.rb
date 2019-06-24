module TestPassagesHelper
  def result_test
    @test_passage.correct_questions >= @test_passage.test.questions.count * 0.85
  end

  def number_question(question)
    @test_passage.test.questions.index(question) + 1
  end
end
