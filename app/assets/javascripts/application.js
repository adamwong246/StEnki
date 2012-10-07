// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require common
//= require live-comment-preview
//= require_self
//= require_tree .

var last_clicked;

$(document).ready(function() {
  Socialite.load($('#social'));

  $('.form_open').click(function(){
    clicked = $(this).next('div.hidden_comment_form');

    if(last_clicked != null ){
      last_clicked.hide('blind',{direction: "vertical"},1000)
    }
    
    clicked.show('blind',{direction: "vertical"},1000);
    last_clicked = clicked;

    return false;
  });
});
