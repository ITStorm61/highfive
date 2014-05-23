window.openUrl = (url) ->
  w = screen.width / 4
  h = w/4*3
  left = (screen.width/2)-(w/2)
  top = (screen.height/2)-(h/2)
  return window.open(url, 'share', "location, width=#{w},height=#{h}, top=#{top}, left=#{left}")

$(document).on 'click', '.share-buttons > a', (e) ->
    parent = $(e.target).parent()
    provider = $(e.target).data('provider')
    description = encodeURIComponent(parent.data('description') || '')
    img = encodeURIComponent(parent.data("image") || '')
    url = encodeURIComponent(parent.data("url") || '')
    switch provider
      when "email"
        window.location.href = "mailto:dima@dima.ru?subject=#{description}&body=#{url}"
      when "twitter"
        window.openUrl("https://twitter.com/home?status=#{description}: #{url}")
      when "facebook"
        window.openUrl("http://www.facebook.com/sharer.php?u=#{url}")
      when "googleplus"
        window.openUrl("https://plus.google.com/share?url=#{url}")
      when "vk"
        window.openUrl("http://vkontakte.ru/share.php?url=#{url}&image=#{img}&description=#{description}")
    false