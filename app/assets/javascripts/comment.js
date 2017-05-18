$( document ).ready(function() {
  // Interactions for creating new Post 
  $("#comment_body").focus(function() {
    $("#submit-comment").show();
  });

  $("#comment_body").blur(function() {
    if($(this).val()){
      $(this).addClass('has-text');
    } else {
      $(this).removeClass('has-text');
    }
  });

  $("#comment_body").keyup(function(){
    if($(this).val()){
      $("#submit-comment").prop("disabled",false);
    } else {
      $("#submit-comment").prop("disabled",true);
    }
  });
});