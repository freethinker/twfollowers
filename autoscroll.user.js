// ==UserScript== 
// @name Auto Scroll
// @namespace http://www.humbug.in/
// @description Auto Scroll Twitter Pages 
// @include https://twitter.com/* 
// ==/UserScript==

t_on = function() {t_out = setTimeout(t_exe, 1);}
t_off = function() {clearTimeout(t_out);}
t_exe = function() {
	window.scrollBy(0,2);
	t_on();
}

window.onload=function(){
t_on();
}

