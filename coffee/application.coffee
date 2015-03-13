contacts_map = new GMaps(
  div: '#map',
  lat: -12.043333,
  lng: -77.028333
)
contacts_map.addMarker
  lat: -12.042
  lng: -77.028333
  title: 'Here'
  infoWindow: content: '<p>Here</p>'

popups = () ->
  dp = '[data-role="popup"]'
  pops = $(dp)
  pops_open = $('[data-role="popup_open"]')
  pops_close = $('[data-role="popup_close"]')
  wind = '[data-role="popup_window"]'

  $(document).keyup((e) ->
    if e.keyCode == 27 && $(".open#{dp}").length > 0
      close(".open#{dp}")
  )

  open = (pop) ->
    if $(".open#{dp}").length > 0
      close($(".open#{dp}"))
    $(pop).css('display', 'block')
    $(pop).addClass('open')
    $('body').css('overflow', 'hidden')

  close = (pop) ->
    $(pop).css('display', 'none')
    $(pop).removeClass('open')
    $('body').css('overflow', 'auto')

  $('body').click ->
    if $(".open#{dp}").length > 0
      close(".open#{dp}")

  $(pops).each ->

    id = $(this).attr('id')

    $(this).find(wind).click((e) ->
      e.stopPropagation();
    )

  $(pops_open).each ->
    $(this).click ->
      target = $(this).attr('data-target')
      if $(target).length > 0
        open(target)
      false

  $(pops_close).each ->
    $(this).click ->
      target = $(this).parents(dp)
      if $(target).length > 0
        close(target)
      false

popups()