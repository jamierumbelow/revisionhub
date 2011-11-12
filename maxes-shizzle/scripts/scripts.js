$(document).ready(function(){
	
	
    $(".defaultText").focus(function(srcc){
        if ($(this).val() == $(this)[0].title){
            $(this).removeClass("defaultTextActive");
            $(this).val("");
        }
    });
    
    $(".defaultText").blur(function(){
        if ($(this).val() == ""){
            $(this).addClass("defaultTextActive");
            $(this).val($(this)[0].title);
        }
    });
    
    $(".defaultText").blur(); 
    
    
    // ----- Top Panel Scripts 
    
    // Expand Panel
	$("#open").click(function(){
		$("div#panel").slideDown("slow");
	
	});	
	
	// Collapse Panel
	$("#close").click(function(){
		$("div#panel").slideUp("slow");	
	});		
	
	// Switch buttons from "Log In | Register" to "Close Panel" on click
	$("#toggle a").click(function () {
		$("#toggle a").toggle();
	});	       
});