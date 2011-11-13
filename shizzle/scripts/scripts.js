$(document).ready(function(){
	
	
    $(".title-text").focus(function(srcc){
        if ($(this).val() == $(this)[0].title){
            $(this).removeClass("title-text-active");
            $(this).val("");
        }
    });
    
    $(".title-text").blur(function(){
        if ($(this).val() == ""){
            $(this).addClass("title-text-active");
            $(this).val($(this)[0].title);
        }
    });
    
    $(".title-text").blur(); 
    
    
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
	
	// ----------------- AJAX Love
	$.ajaxSetup ({  
        cache: false  
    });  
    
    var ajaxIndicator = "<img src='../images/ajax-loader.gif' alt='Loading...' />"; // indicator url  
    var loadUrl = "ajax/load.php"; // page where the stuff is grabbed from
    
	$("#load_post").click(function(){
		$("#result")
			.html(ajaxIndicator)
			.load(loadUrl, {language: "php", version: 5} function(responseText){
				alert("worked" + responseText);
			});
	});

	
});