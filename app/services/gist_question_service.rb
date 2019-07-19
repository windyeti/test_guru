class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || OctoClient.new
    # @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_params
    {
        description: I18n.t('services.gist_question_services.description', title: "#{@test.title}"),
        public: true,
        files: {
            "question.txt" => {
                content: content_question
            }
        }
    }
  end

  private

  def content_question
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
