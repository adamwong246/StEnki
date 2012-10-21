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
# = require live-comment-preview
# = require_self
# = require_tree .

$last_opened_area = undefined
$(document).ready ->
  #Socialite.load $("#social2")
  $("#social2 > li").one "mouseenter", ->
    Socialite.load $(this)[0]
  

  # $("article.text").one "mouseenter", ->
  #   Socialite.load $(this)[0]




  # Socialite.load $(".social-buttons")

  # $("a.form_open").click ->
  #   $opened_area = $(this).next(".form_and_preview_container") #.children('div.hidden_comment_form');

  #   if ( $opened_area.is(':visible'))
  #     # alert("visible");
  #     $opened_area.hide('blind',{direction: "vertical"},1000);
  #   else
  #     # alert("invisible");
  #     $opened_area.show('blind',{direction: "vertical"},1000);
    
  #   false

