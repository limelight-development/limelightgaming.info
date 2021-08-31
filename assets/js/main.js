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
