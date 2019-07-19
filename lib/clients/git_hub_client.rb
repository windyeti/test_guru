class GitHubClient
  def initialize
    @http_client = create_http
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ENV['ACCESS_TOKEN']}"
      request.headers['Content-Type'] = "application/json"
      request.body = params.to_json
    end
  end

  private

  def create_http
    Faraday.new(url: "#{ENV['ROOT_ENDPOINT']}")
  end

end
