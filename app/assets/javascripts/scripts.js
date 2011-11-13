$(document).ready(function(){
	
	
    $(".prompt").focus(function(src){
        if ($(this).val() == $(this)[0].title){
            $(this).removeClass("prompt-active");
            $(this).val("");
        }
    });
    
    $(".prompt").blur(function(){
        if ($(this).val() == ""){
            $(this).addClass("prompt-active");
            $(this).val($(this)[0].title);
        }
    });
    
    $(".prompt").blur(); 
    
    
    // ----- Top Panel Scripts 
   
    // Expand Panel
	$("#open").click(function(e){
		$("div#panel").slideDown("slow");
        e.preventDefault();
	});	
	
	// Collapse Panel
	$("#close").click(function(){
		$("div#panel").slideUp("slow");	
	});		
	
	// Switch buttons from "Log In | Register" to "Close Panel" on click
    //console.log($("#toggle"));
	//$("#toggle a").click(function () {
        //console.log("toggled");
		//$("#toggle a").toggle();
        //return false;
	//});	       
});
