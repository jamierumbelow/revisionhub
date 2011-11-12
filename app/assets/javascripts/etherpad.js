/**
 * etherpad.js
 * https://github.com/johnyma22/etherpad-lite-jquery-plugin
 * 
 * by John McLear <john@mclear.co.uk>
 */
(function(c){c.fn.pad=function(a){var b={host:"http://localhost:9001",baseUrl:"/p/",showControls:true,showChat:false,showLineNumbers:true,userName:"unnamed",useMonospaceFont:false,noColors:"false"};if(!a.getContents){a&&c.extend(b,a);var d=this.attr("id");this.html('<iframe id="epframe'+d+'" src="'+b.host+b.baseUrl+b.padId+"?showControls="+b.showControls+"&showChat="+b.showChat+"&showLineNumbers="+b.showLineNumbers+"&useMonospaceFont="+b.useMonospaceFont+"&userName="+b.userName+"&noColors="+b.noColors+
'"></iframe>')}if(a.getContents){var e=a.getContents,d="epframe"+this.attr("id"),a=document.getElementById(d).src;a.indexOf("?")>-1&&(a=a.substr(0,a.indexOf("?")));c.get(a+"/export/html",function(a){c("#"+e).html(a)})}}})(jQuery);