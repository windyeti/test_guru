class GitHubClient
  ENDPOINT = "http://api.github.com"
  TOKEN = "11183606f34d3eba0d87e5e19e6ff57681bc0502"

  def initialize
    @http_client = create_http
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{TOKEN}"
      request.headers['Content-Type'] = "application/json"
      request.body = params.to_json
    end
  end

  private

  def create_http
    Faraday.new(url: ENDPOINT)
  end

end
