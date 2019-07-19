class OctoClient
  def initialize
    @http_client = Octokit::Client.new(:access_token => "31811311888e7a531b212d21c5ecbe4da813c41a")
  end

  def create_gist(options)
    @http_client.create_gist(options)
  end
end
