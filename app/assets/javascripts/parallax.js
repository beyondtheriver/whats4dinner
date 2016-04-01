$(document).ready(function(){
   $(window).scroll(function() {
      var j = $(window).scrollTop();
      $("#header_title h1").css('transform', 'translateY(' + (j*1.3) + 'px)');
      // $("#header_title").css('top', (500-j));
      // $("#header_title h1").css('top', (j/4));
      // console.log("parallax");
   })
})
