// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){  
      
        $("ul.subnav").parent().append("<span></span>"); //Only shows drop down trigger when js is enabled (Adds empty span tag after ul.subnav*)  
      
        $("ul.topnav li span").click(function() { //When trigger is clicked...  
      
            //Following events are applied to the subnav itself (moving subnav up and down)  
            $(this).parent().find("ul.subnav").slideDown('fast').show(); //Drop down the subnav on click  
      
            $(this).parent().hover(function() {  
            }, function(){  
                $(this).parent().find("ul.subnav").slideUp('slow'); //When the mouse hovers out of the subnav, move it back up  
            });  
      
            //Following events are applied to the trigger (Hover events for the trigger)  
            }).hover(function() {  
                $(this).addClass("subhover"); //On hover over, add class "subhover"  
            }, function(){  //On Hover Out  
                $(this).removeClass("subhover"); //On hover out, remove class "subhover"  
        });  
      
});  
