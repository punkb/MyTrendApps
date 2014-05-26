// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require jquery.remotipart



//= require mousetrap
//= require turbolinks
//= require_tree .
var mins = 1;
 
// calculate the seconds (don't change this! unless time progresses at a different speed for you...)
var secs = mins * 60;
function countdown() {
setTimeout('Decrement()',1000);
}
function Decrement() {
if (document.getElementById) {
minutes = document.getElementById("minutes");
seconds = document.getElementById("seconds");
// if less than a minute remaining
if (seconds < 59) {
seconds.value = secs;
} else {
minutes.value = getminutes();
seconds.value = getseconds();
}
secs--;
setTimeout('Decrement()',1000);
}
}
function getminutes() {
// minutes is seconds divided by 60, rounded down
mins = Math.floor(secs / 60);
return mins;
}
function getseconds() {
// take mins remaining (as seconds) away from total seconds remaining
return secs-Math.round(mins *60);
}



function betResult()
{
setInterval(function(){alert("Congrats You Won !!!")},3000);
}



function myToggle()
{

	 $("#subTableRow1").click(function(){
    $("#subTableRow2").fadeToggle();
  })

}

