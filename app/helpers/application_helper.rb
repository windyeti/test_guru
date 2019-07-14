module ApplicationHelper
  def github_url(author, repo)
    "https://www.github.com/#{author}/#{repo}"
  end

  def year
    Time.current.year
  end

  def flash_message(flash)
    pp flash
    list = flash.map do |type , message|
      case type
      when 'alert' then "<div class='alert alert-danger' role='alert' >#{message}</div>"
      when 'notice' then "<div class='alert alert-info' role='alert' >#{message}</div>"
      when 'success' then "<div class='alert alert-success' role='alert' >#{message}</div>"
      else "<div class='alert alert-secondary' role='alert' >#{message}</div>"
      end
    end
    list.join(' ').html_safe
  end
end
