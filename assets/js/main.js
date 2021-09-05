//
// Add a class to the header bar if we're scrolled down
//
$(window).scroll(function() {
  var header = $('.nav.container');
  var bgfix = $('.page-bg');

  var scroll = $(window).scrollTop();
  if (scroll >= 80) {
    header.addClass('nav-scroll');
    bgfix.addClass('bgfix');
  } else {
    header.removeClass('nav-scroll');
    bgfix.removeClass('bgfix');
  }
});

//
// Mobile menu functionality
//
$('.btn-mobile').click(function() {
  $('.mobile.container').toggle();
  $('.nav.container').toggleClass('mobile-open');
})
$('.mobile-links a').click(function() {
  $('.mobile.container').toggle();
  $('.nav.container').toggleClass('mobile-open');
})

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

//
// Add class to nav as user scrolls through page
//
var addClassOnScroll = function () {
  var windowTop = $(window).scrollTop();
  $('.container[id]').each(function (index, elem) {
    var offsetTop = $(elem).offset().top;
    var outerHeight = $(this).outerHeight(true);

    if( windowTop > (offsetTop - 350) && windowTop < ( offsetTop + outerHeight)) {
      var elemId = $(elem).attr('id');
      $(".nav-links a.active").removeClass('active');
      $(".nav-links a[href='#" + elemId + "']").addClass('active');
    }
  });
};

$(function () {
  $(window).on('scroll', function () {
    addClassOnScroll();
  });
});

//
// Years that LL has been in operation
//
$(document).ready(function() {
  $('#years-est').html((index, html) => {
    var date = moment([2015, 8, 6]);
    var now = moment();

    days = now.diff(date, 'days');
    years = (days / 365).toFixed(1);
    return years;
  });
});
