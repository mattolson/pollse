module ApplicationHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, :alt => user.username, :class => "gravatar")
  end

  def markdown(text)
    return '' if text.nil?
    markdown_parser.render(text).html_safe
  end
end
