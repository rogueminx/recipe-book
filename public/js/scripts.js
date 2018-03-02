
$(document).ready(function(event){
  event.preventDefault;
  $("#clickrecipe").click(function(){
      $(".editname").toggle();
  });
  $("#clickingredients").click(function(){
      $(".editingredients").toggle();
  });
  $("#clickinstructions").click(function(){
      $(".editinstructions").toggle();
  });
  $("#rating").submit(function(event){
    event.preventDefault()
    var rating = $("#rating").val();
    if (rating = 1) {
      $("#deletealert").fadeIn();
    };
  });
});
