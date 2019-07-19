class GitHubClient
  ENDPOINT = "https://api.github.com"
  TOKEN = "31811311888e7a531b212d21c5ecbe4da813c41a"

  def initialize
    @http_client = create_http
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{TOKEN}"
      request.headers['Content-Type'] = "application/json"
      request.body = params
    end
  end

  private

  def create_http
    Faraday.new(url: ENDPOINT)
  end

end
