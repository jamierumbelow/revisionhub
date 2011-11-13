$(document).ready(function(){
	
    $("#guestmessage").text($('body').attr('data-current-user-name'));	
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
