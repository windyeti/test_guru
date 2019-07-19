class GistQuestionService
  class Result
    def initialize(response)
      @response = response
    end

    def success?
      @response[:html_url].present?
    end

    def gist_url
      @response[:html_url]
    end
  end

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def default_client
    OctokitClient.new
    # GitHubClient.new
  end

  def call
    response = @client.create_gist(gist_params)
    Result.new(response)
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
