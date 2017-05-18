$( document ).ready(function() {
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

  $(document).on('keyup','#comment_body',function(){
    console.log('here');
    console.log($(this).val());
    if($(this).val()){
      $("#submit-comment").prop("disabled",false);
    } else {
      $("#submit-comment").prop("disabled",true);
    }
  });
});