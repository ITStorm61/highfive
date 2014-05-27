# coding: utf-8
module TasksHelper
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

  def display_status(status)
    if status == 'new'
      return 'Новое'
    elsif status == 'in_process'
      return 'Выполняется'
    elsif status == 'ready'
      return 'Награждение'
    elsif status == 'done'
      return 'Завершено'
    elsif status == 'canceled'
      return 'Отменено'
    else
      return 'Статус неизвестен'
    end
  end
end
