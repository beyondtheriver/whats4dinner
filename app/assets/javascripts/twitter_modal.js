window.onload = function(){
   // Get the modal
   var modal = $('.modal_features');
   // Get the button that opens the modal
   var btn = document.getElementsByClassName("modal_button");
   // Get the <span> element that closes the modal
   var span = document.getElementsByClassName("close")[0];
   // When the user clicks on the button, open the modal
   $('.modal_button').click(function(){
     console.log("Firing.");
     $(this).parent().find('.modal_features').css("display","block");
   })
   // When the user clicks on <span> (x), close the modal
   $('.close').click(function(){
      $(this).parent().parent().css("display", "none");
   })
   // When the user clicks anywhere outside of the modal, close it
   $(window).click(function(e) {
      if (($(e.target).parents('.modal_features').length == 0) && !$(e.target).hasClass('modal_button')) {
         modal.css("display", "none");
      }
   })
   // window.onclick = function(event) {
   //    if (event.target == modal) {
   //       modal.css("display", "none");
   //    }
   // }
};
