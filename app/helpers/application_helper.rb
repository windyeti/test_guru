module ApplicationHelper
  def github_url(author, repo)
    "https://www.github.com/#{author}/#{repo}"
  end

  def year
    Time.current.year
  end
end
