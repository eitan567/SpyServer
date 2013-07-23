$(document).ready(function() {
	
	// Expand Panel
	$("#openMe").click(function(){
		$("div#panel").slideDown("slow");	
	});	
	
	// Collapse Panel
	$("#closeMe").click(function(){
		$("div#panel").slideUp("slow");	
	});		
	
	// Switch buttons from "Log In | Register" to "Close Panel" on click
	$("#toggle a").click(function () {
		$("#toggle a").toggle();
	});		
		
});