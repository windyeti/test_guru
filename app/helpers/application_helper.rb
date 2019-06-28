module ApplicationHelper
  def github_url(author, repo)
    "https://www.github.com/#{author}/#{repo}"
  end

  def year
    Time.current.year
  end

  def flash_message(flash)
    flash.map {|type , message| "<div class='flash_#{type}'>#{message}</div>"}.join(' ')
  end
end
