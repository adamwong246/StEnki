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
//= require jquery
//= require jquery_ujs
//= require common
//= require live-comment-preview
//= require_self
//= require bootstrap
//= require_tree .

$(function(){
    $('#demo1').sharrre({
      share: {
        googlePlus: true,
        facebook: true,
        twitter: true,
        delicious: true
      },
      buttons: {
        googlePlus: {size: 'tall'},
        facebook: {layout: 'box_count'},
        twitter: {count: 'vertical'},
        delicious: {size: 'tall'}
      },
      hover: function(api, options){
        $(api.element).find('.buttons').show();      
      },
      hide: function(api, options){
        $(api.element).find('.buttons').hide();
      }
    });
    
    $('#demo2').sharrre({
      share: {
        googlePlus: true,
        facebook: true,
        twitter: true
      },
      url: 'http://sharrre.com',
      enableHover: false
    });
  });