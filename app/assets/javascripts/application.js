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
  function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
      sURLVariables = sPageURL.split('&'),
      sParameterName,
      i;
    for (i = 0; i < sURLVariables.length; i++) {
      sParameterName = sURLVariables[i].split('=');
      if (sParameterName[0] === sParam) {
        return sParameterName[1] === undefined ? true : sParameterName[1];
      }
    }
  };
  function logoColor(color_id) {
    if (color_id == '1') {
      $('#logo').css('background-color', '#b76e79');
      $('h1, h2, h3, h4').css('color', '#b76e79');
    } else if (color_id == '2') {
      $('#logo').css('background-color', '#b0cddf');
      $('h1, h2, h3, h4').css('color', '#b0cddf');
    } else if (color_id == '3') {
      $('#logo').css('background-color', '#955251');
      $('h1, h2, h3, h4').css('color', '#955251');
    } else if (color_id == '4') {
      $('#logo').css('background-color', '#b163a3');
      $('h1, h2, h3, h4').css('color', '#b163a3');
    }
  };
  var color_id = getUrlParameter('color_id');
  logoColor(color_id);

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
