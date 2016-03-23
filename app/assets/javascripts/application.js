// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
  //get width of a room div
  var boxDiv = $('.room1').width();
  //make all room divs squares by applying a height equal to the width
  $('[class^="room"]').css({'height':boxDiv+'px'});
  //repeat above code if window is resized
  $(window).on('resize', function(){
    boxDiv = $('.room1').width();
    $('[class^="room"]').css({'height':boxDiv+'px'});
  });

  //make clicking on a room div submit the form
  $('[class^="room"]').click(function () {
    $('form').submit();
  });

  //initialize masonry.js
  $('.grid').masonry({
    itemSelector: '.grid-item',
  });
});
