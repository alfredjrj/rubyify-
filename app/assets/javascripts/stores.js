// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



    $(document).ready(function(){
    $("#phone_view").click(function(){
        $("#preview").width(580);
           $("#preview").height(870);
           $("#preview").css("left", "50px")
    });
    
     $("#desktop_view").click(function(){
        $("#preview").width(800);
           $("#preview").height(450);
    });
  
});
    