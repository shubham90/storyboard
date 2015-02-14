// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


			
$(document).ready(function(){
    $("input[type=password]").keyup(function(){ 
  if($("#user_password").val().length >= 8){
      submit1.disabled=true;
    $("#8char").removeClass("glyphicon-remove");
    $("#8char").addClass("glyphicon-ok");
    $("#8char").css("color","#00A41E");
  }else{
      submit1.disabled=true;
    $("#8char").removeClass("glyphicon-ok");
    $("#8char").addClass("glyphicon-remove");
    $("#8char").css("color","#FF0004");
  }
  if(($("#user_password").val() == $("#user_password_confirmation").val()) && $("#user_password").val()!="" ){
    submit1.disabled=false;
    $("#pwmatch").removeClass("glyphicon-remove");
    $("#pwmatch").addClass("glyphicon-ok");
    $("#pwmatch").css("color","#00A41E");
    
  }else{
    $("#pwmatch").removeClass("glyphicon-ok");
    $("#pwmatch").addClass("glyphicon-remove");
    $("#pwmatch").css("color","#FF0004");
  }
  });

});