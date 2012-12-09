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
# = require common
# = require_self
# = require_tree .

$last_opened_area = undefined
$(document).ready ->
  #Socialite.load $("#social2")
  $("#social2 > li").one "mouseenter", ->
    Socialite.load $(this)[0]
  

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

    else
      $("#sticky_navigation").css position: "relative"

  
  # run our function on load
  sticky_navigation()
  
  # and run it again every time you scroll
  $(window).scroll ->
    sticky_navigation()

$ -> # onload

  ##########################
  $("a#show_footnotes").click -> 
    $("#footnotes_holder").toggle()
    $("#footnotes_holder").scrollTop()
    return false