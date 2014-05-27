module ApplicationHelper
  def bar_link_to(title, path)
    strClass = 'btn btn-default'
    strClass += 'btn btn-active' if request.fullpath == path
    return link_to title, path, :class => strClass
  end

  def login_path
    return Rails.env.production? ? "/auth/vkontakte" : "/auth/developer"
  end
end
