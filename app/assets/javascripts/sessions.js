// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
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
