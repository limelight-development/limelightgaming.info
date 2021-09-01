//
// Add a class to the header bar if we're scrolled down
//
$(window).scroll(function() {
  var header = $(".nav.container");

  var scroll = $(window).scrollTop();
  if (scroll >= 80) {
    header.addClass("nav-scroll");
  } else {
    header.removeClass("nav-scroll");
  }
});

//
// Swap server section background
//
$('.server-single').mouseenter(function () {
  var serverBG = $(this).find('.server-banner').data('server-bg');
  var serverImg = $('#server-bg').css('background-image');

  var cleanup = /\"|\'|\)/g;
  var serverBGsource = serverBG.split('/').pop().replace(cleanup, '');
  serverImg = serverImg.split('/').pop().replace(cleanup, '');

  if (serverImg != serverBGsource) {
    $('#server-bg').css({'background-image': 'url('+serverBG+')', 'animation-name': ''});
    $('#server-bg').width();
    $('#server-bg').css('animation-name', 'bg-zoom');
  }
});
