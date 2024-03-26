// $(document).ready() will only run once the page Document Object Model (DOM) is ready for JavaScript code to execute
$(document).ready(function(){
  // .append add string objects
  $('.pass_show').append('<span class="ptxt">Show</span>');  
  });
    
$(document).on('click','.pass_show .ptxt', function(){ 
  $(this).text($(this).text() == "Show" ? "Hide" : "Show"); 
  $(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 
  });  

