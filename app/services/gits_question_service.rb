class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_params
    {
        description: "Question of test #{@test}",
        public: true,
        files: {
            "question_and_answers.txt" => {
                content: content_question
            }
        }
    }
  end

  private

  def content_question
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join('\n')
  end
end
