// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
// <![CDATA[
var colours=new Array("##00FFFF", "#008080", "#008080", "#008080", "#008080"); // colours for top, right, bottom and left borders and background of bubbles
    var bubbles=100; // maximum number of bubbles on screen
    var x=ox=400;
    var y=oy=300;
    var swide=800;
    var shigh=600;
    var sleft=sdown=0;
    var bubb=new Array();
    var bubbx=new Array();
    var bubby=new Array();
    var bubbs=new Array();
    window.onload=function() { if (document.getElementById) {
    var rats, div;
    for (var i=0; i<bubbles; i++) {
    rats=createDiv("3px", "3px");
    rats.style.visibility="hidden";
    div=createDiv("auto", "auto");
    rats.appendChild(div);
    div=div.style;
    div.top="1px";
    div.left="0px";
    div.bottom="1px";
    div.right="0px";
    div.borderLeft="1px solid "+colours[3];
    div.borderRight="1px solid "+colours[1];
    div=createDiv("auto", "auto");
    rats.appendChild(div);
    div=div.style;
    div.top="0px";
    div.left="1px";
    div.right="1px";
    div.bottom="0px"
    div.borderTop="1px solid "+colours[0];
    div.borderBottom="1px solid "+colours[2];
    div=createDiv("auto", "auto");
    rats.appendChild(div);
    div=div.style;
    div.left="1px";
    div.right="1px";
    div.bottom="1px";
    div.top="1px";
    div.backgroundColor=colours[4];
    div.opacity=0.5;
    if (document.all) div.filter="alpha(opacity=50)";
    document.body.appendChild(rats);
    bubb[i]=rats.style;
    }
    set_scroll();
    set_width();
    bubble();
    }}
    function bubble() {
    var c;
    if (x!=ox || y!=oy) {
    ox=x;
    oy=y;
    for (c=0; c<bubbles; c++) if (!bubby[c]) {
    bubb[c].left=(bubbx[c]=x)+"px";
    bubb[c].top=(bubby[c]=y)+"px";
    bubb[c].width="3px";
    bubb[c].height="3px"
    bubb[c].visibility="visible";
    bubbs[c]=3;
    break;
    }
    }
    for (c=0; c<bubbles; c++) if (bubby[c]) update_bubb(c);
    setTimeout("bubble()", 40);
    }
    function update_bubb(i) {
    if (bubby[i]) {
    bubby[i]-=bubbs[i]/2+i%2;
    bubbx[i]+=(i%5-2)/5;
    if (bubby[i]>sdown && bubbx[i]>0) {
    if (Math.random()<bubbs[i]/shigh*2 && bubbs[i]++<8) {
    bubb[i].width=bubbs[i]+"px";
    bubb[i].height=bubbs[i]+"px";
    }
    bubb[i].top=bubby[i]+"px";
    bubb[i].left=bubbx[i]+"px";
    }
    else {
    bubb[i].visibility="hidden";
    bubby[i]=0;
    return;
    }
    }
    }
    document.onmousemove=mouse;
    function mouse(e) {
    set_scroll();
    y=(e)?e.pageY:event.y+sleft;
    x=(e)?e.pageX:event.x+sdown; }
    window.onresize=set_width;
    function set_width() {
    if (document.documentElement && document.documentElement.clientWidth) {
    swide=document.documentElement.clientWidth;
    shigh=document.documentElement.clientHeight;
    }
    else if (typeof(self.innerHeight)=="number") {
    swide=self.innerWidth;
    shigh=self.innerHeight;
    }
    else if (document.body.clientWidth) {
    swide=document.body.clientWidth;
    shigh=document.body.clientHeight;
    }
    else {
    swide=800;
    shigh=600;
    }
    }
    window.onscroll=set_scroll;
    function set_scroll() {
    if (typeof(self.pageYOffset)=="number") {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
    }
    else if (document.body.scrollTop || document.body.scrollLeft) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
    }
    else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
    }
    else {
    sdown=0;
    sleft=0;
    }
    }
    function createDiv(height, width) {
    var div=document.createElement("div");
    div.style.position="absolute";
    div.style.height=height;
    div.style.width=width;
    div.style.overflow="hidden";
    return (div);
    }
    // ]]>
