#  This is a manifest file that'll be compiled into application.js, which will include all the files
#  listed below.
# 
#  Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
#  or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# 
#  It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#  the compiled file.
# 
#  WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
#  GO AFTER THE REQUIRES BELOW.
# 
# = require jquery
# = require jquery_ujs
# = require jquery-ui
# = require bootstrap
# = require jquery.turbolinks
# = require turbolinks
# = require common
# = require best_in_place
# = require_self
# = require_tree .

# For editning object 'in place'
# $ ->
#   $('.best_in_place').best_in_place()

# Load the socialite button when you mouseover of it
# $ ->
#   $("#social2 > li").one "mouseenter", ->
#     Socialite.load $(this)[0]


# scroll to top button
$ -> 
  $("a#scroll_to_top").click -> 
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;

    

    # $(this).children(".socialite").css
    #   "height": 30

# Launches the modal window containing flash messages.
$(window).load ->
    $('#modal-flash').modal
        keyboard: false

(($) ->  
  # VERTICALLY ALIGN FUNCTION
  $.fn.vAlign = ->
    @each (i) ->
      ah = $(this).height()
      ph = $(this).parent().height()
      mh = Math.ceil((ph - ah) / 2)
      $(this).css "margin-top", mh

) $

# sticky navigation bar
$ ->  
  # grab the initial top offset of the navigation 
  sticky_navigation_offset_top = $("#sticky_navigation").offset().top
  
  # our function that decides weather the navigation bar should have "fixed" css position or not.
  sticky_navigation = ->
    scroll_top = $(window).scrollTop() # our current vertical position from the top
    
    # if we've scrolled more than the navigation, change its position to fixed to stick to top,
    # otherwise change it back to relative
    if scroll_top > sticky_navigation_offset_top
      
      
      $("#sticky_navigation").css
        position: "fixed"
        top: 0
        left: 0
        opacity: .5



    else
      $("#sticky_navigation").css 
        position: "relative"
        opacity: 1

  
  # run our function on load
  sticky_navigation()
  
  # and run it again every time you scroll
  $(window).scroll ->
    sticky_navigation()

# http://james.padolsey.com/javascript/special-scroll-events-for-jquery/
(->
  special = jQuery.event.special
  uid1 = "D" + (+new Date())
  uid2 = "D" + (+new Date() + 1)
  special.scrollstart =
    setup: ->
      timer = undefined
      handler = (evt) ->
        _self = this
        _args = arguments_
        if timer
          clearTimeout timer
        else
          evt.type = "scrollstart"
          jQuery.event.handle.apply _self, _args
        timer = setTimeout(->
          timer = null
        , special.scrollstop.latency)

      jQuery(this).bind("scroll", handler).data uid1, handler

    teardown: ->
      jQuery(this).unbind "scroll", jQuery(this).data(uid1)

  special.scrollstop =
    latency: 100
    setup: ->
      timer = undefined
      handler = (evt) ->
        _self = this
        _args = arguments_
        clearTimeout timer  if timer
        timer = setTimeout(->
          timer = null
          evt.type = "scrollstop"
          jQuery.event.handle.apply _self, _args
        , special.scrollstop.latency)

      jQuery(this).bind("scroll", handler).data uid2, handler

    teardown: ->
      jQuery(this).unbind "scroll", jQuery(this).data(uid2)
)()