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

    // other background:

    /* because me lazy */
Object.getOwnPropertyNames(Math).map(function(p) {
  window[p] = Math[p];
});

var rand = function(min, max, isInt) {
  var max = ((max - 1) || 0) + 1,
      min = min || 0,
      gen = min + (max - min)*random();

  return (isInt)?(~~gen):gen;
};

var σ = function() {
  return (random() < .5)?-1:1;
};

Node.prototype.setAttrs = function(attr_obj) {
  for(var prop in attr_obj) {
    this.setAttribute(prop, attr_obj[prop]);
  }
};

var BF_MIN = .01, NO_MIN = 2,
		BF_MAX = .02, NO_MAX = 8,
		BASE = 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/2017/ccc_15.08.21_sea_creatures_',
		EXT = '.gif',
		PRIMARY = [
			{ 'fix': null, 'dir': -1 },
			{ 'fix': 1, 'dir': null },
			{ 'fix': null, 'dir': 1 },
			{ 'fix': null, 'dir': null },
			{ 'fix': 0, 'dir': -1 },
		],
		N_PRIMARY = PRIMARY.length,

		w, h,
		creatures = [], n = 0,
		fe_t = document.getElementById('turbulence'),
		curr_bf = 1*fe_t.getAttribute('baseFrequency'),
    // window.onload = function () {
    // var curr_bf = document.getElementById("turbulence").getAttribute("baseFrequency");
    // }
		curr_no = ~~fe_t.getAttribute('numOctaves'),
		bf_step = .0001, no_step = .002, t = 0,
		r_id_bg = null, r_id_fish = null, t = 0;

var Creature = function(x, y) {
	this.idx = rand(N_PRIMARY, 0, 1);
	this.prim = PRIMARY[this.idx];
	this.x = x || rand(w, 0, 1);
	this.y =
		(this.prim.fix === null) ?
		(y || rand(h, 0, 1)) :
		this.prim.fix*h;
	this.el = document.createElement('div');
	this.img = document.createElement('img')
	this.rev = round(random());
	this.dir = pow(-1, this.rev)*((this.prim.dir !== null)?this.prim.dir:σ());
	this.sf = 1*(rand(1, .56).toFixed(2));
	this.hue = rand(360, 0, 1);
	this.v = this.dir*rand(8, 1, 1);
	this.f = 1/rand(120, 60, 1);

	this.init = function() {
		var filter = 'hue-rotate(' + this.hue + 'deg) brightness(.5)';

		this.img.setAttribute('src', BASE + this.idx + EXT);

		this.img.style.transform =
			'translate(-50%, -50%)' +
			'scale(' + pow(-1, this.rev)*this.sf + ',' + this.sf + ')' +
			((this.prim.fix !== null) ?
			'translate(0, ' + pow(-1, this.prim.fix)*50 + '%)' : '');
		this.img.style.webkitFilter = filter;
		this.img.style.filter = filter;

		this.position();

		this.el.appendChild(this.img);

		document.body.appendChild(this.el);
	};

	this.position = function() {
		this.el.style.transform =
			'translate(' + this.x + 'px,' + this.y + 'px)';
	};

	this.move = function() {
		this.x += this.v*(1 + .75*sin(t*2*PI*this.f));

		if(this.x < - w) {
			this.x = 2*w
		}
		if(this.x > 2*w) {
			this.x = -w;
		}

		this.position();
	};

	this.init();
;};

var init = function() {
	size();
};

var size = function() {
	var s = getComputedStyle(document.body);

	w = ~~s.width.split('px')[0];
	h = ~~s.height.split('px')[0];
};

var life = function() {
	for(var i = 0; i < n; i++) {
		creatures[i].move();
	}

	t++;
	r_id_fish = requestAnimationFrame(life);
};

var alterFilter = function() {
		curr_bf += bf_step;
		curr_no += no_step;

		if(curr_bf < BF_MIN || curr_bf > BF_MAX) {
			bf_step *= -1;
		}
		if(curr_no < NO_MIN || curr_no > NO_MAX) {
			no_step *= -1;
		}

		fe_t.setAttrs({
			'baseFrequency': curr_bf.toFixed(4)/*,
			'numOctaves': curr_no.toFixed(3)*/
		});

	r_id_bg = requestAnimationFrame(alterFilter);
};

init();
alterFilter();

addEventListener('resize', size, false);
addEventListener('dblclick', function(e) {
	creatures.push(new Creature(e.clientX, e.clientY));
	n++;
	if(n === 1) { life(); }
}, false);
