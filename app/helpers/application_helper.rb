module ApplicationHelper
  def full_title(page_title)
    base_title = "Plzki"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def bar_link_to(title, path)
    strClass = 'btn btn-default'
    strClass += ' active' if request.fullpath == path
    return link_to title, path, :class => strClass
  end
end
