$(document).ready(function(){
   // $('#header_title h1').hide();
   $(window).scroll(function() {
      var j = $(window).scrollTop();
      $("#header_title h1").css('transform', 'translateY(' + (j*1.3) + 'px)');

      // if($(this).scrollTop() < 300) $('#header_title h1').fadeIn('slow');
      // if($(this).scrollTop() > 300) $('#header_title h1').hide('easing');
      //^^^ this works too, if configured correctly.
      //below is Jon's suggestion with css opacity.
      if ($(this).scrollTop() > 100 && $(this).scrollTop() <200) {
         $('#header_title h1').show();
         var op = (100 - ($(this).scrollTop()-100))/100;
         $('#header_title h1').css("opacity", op );
         console.log("HERE: " + $(this).scrollTop())
      }else if ($(this).scrollTop() < 101){
         $('#header_title h1').css("opacity", 1);
      }else {
         $('#header_title h1').hide();
      };
   })
})
