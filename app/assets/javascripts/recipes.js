$(document).ready(function() {
    var max_fields      = 4;
    var wrapper         = $("#searchForm");
    var add_button      = $(".add_field_button");

    var x = 1;
    $(add_button).click(function(e){
        e.preventDefault();
        if(x < max_fields){
            x++;
            $(wrapper).append('<div><input type="text" name="ingredients[]" id="ingredients_"/><a href="#" class="remove_field">Remove</a></div>');
            //     var addedIngredients = $('#ingredients_').val();
            // $('#ingredForm').append(addedIngredients);
        }
    });

    // var x = 1; //initial text box count
    // $(add_button).click(function(e){ //on add input button click
    //     e.preventDefault();
    //     if(x < max_fields){ //max input box allowed
    //         x++; //text box increment
    //         $(wrapper).append('<div><input type="text" name="ingredients[]" class="ingredients_"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
    //             var addedIngredients = $('.ingredients_').each(function() {
    //                 console.log($(this).val())
    //                 $('#ingredForm').append($(this).val());
    //             })

    //     }
    // });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    });


    // $(".add_field_button").click(function(e){
    //     e.preventDefault();
    //     var addedIngredients = $('#ingredients_').val();

    //         $('#ingredForm').html(addedIngredients);
    //     });


  // function showIngredients() {
  //   $('#ingredient_search').click(function() {
  //     var data = {
  //       addedIngredients: $('#ingredients_').val(),
  //     }

  //       $.post(
  //         '/ingredient_search',
  //         data,
  //         function(response) {
  //           $('#recipe_responses').html(data)
  //         }
  //       )
  //   })

  // }
});
