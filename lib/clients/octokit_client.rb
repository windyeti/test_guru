class OctokitClient
  def initialize
    @http_client = Octokit::Client.new(:access_token => "#{ENV['GIST_ACCESS_TOKEN']}")
  end

  def create_gist(options)
    @http_client.create_gist(options)
  end
end
