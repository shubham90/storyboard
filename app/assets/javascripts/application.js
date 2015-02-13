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

					$(".assigned").click(function() { 
						
						if($(this).is(":checked")) {
							$.ajax({
								url: '/projects/1/stories/1/assign.json',
								type: 'POST',
								data: {id: $(this).attr("data-story-id"), project_id: $(this).attr("data-project-id"), story: {assign: 1}},
								success : function(data){
		

									alert("Developer is successfully assigned")		
								}
							});		
						} else {
							$.ajax({
								url: '/projects/1/stories/1/assign.json',
								type: 'POST',
								data: {id: $(this).attr("data-story-id"), project_id: $(this).attr("data-project-id"), story: {assign: 0}},
								success : function(data){
									console.log("I am de-assigned")
									alert("Developer is successfully de-assigned")			
								}
							});	
								
						}


						
					}); 
				});	
			

			
