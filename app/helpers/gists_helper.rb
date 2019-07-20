module GistsHelper
  def hash(url)
    "#{url.split('/').last}"
  end
end
