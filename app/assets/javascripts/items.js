// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


  $(document).ready(function(){
    $("#phone_view").click(function(){
        $("#preview").width(400);
           $("#preview").height(640);
    });
    
     $("#desktop_view").click(function(){
        $("#preview").width(800);
           $("#preview").height(450);
    });
});
    