$( document ).ready(function() {

  $('.users .card-image .material-icons').click(function() {
    $(this).siblings("input[type=file]").click(); 
  });

  $('.users .card-image .material-icons').siblings("input[type=file]").change(function(){
    $(this).parents('form').submit();
  });

});
