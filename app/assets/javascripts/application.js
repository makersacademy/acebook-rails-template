var colour="#ff00f0";
var sparkles=80;

var x=ox=400;
var y=oy=300;
var swide=800;
var shigh=600;
var sleft=sdown=0;
var tiny=new Array();
var star=new Array();
var starv=new Array();
var starx=new Array();
var stary=new Array();
var tinyx=new Array();
var tinyy=new Array();
var tinyv=new Array();
window.onload=function() { if (document.getElementById) {
  var i, rats, rlef, rdow;
  for (var i=0; i<sparkles; i++) {
    var rats=createDiv(3, 3);
    rats.style.visibility="hidden";
    document.body.appendChild(tiny[i]=rats);
    starv[i]=0;
    tinyv[i]=0;
    var rats=createDiv(5, 5);
    rats.style.backgroundColor="transparent";
    rats.style.visibility="hidden";
    var rlef=createDiv(1, 5);
    var rdow=createDiv(5, 1);
    rats.appendChild(rlef);
    rats.appendChild(rdow);
    rlef.style.top="2px";
    rlef.style.left="0px";
    rdow.style.top="0px";
    rdow.style.left="2px";
    document.body.appendChild(star[i]=rats);
  }
  set_width();
  sparkle();
}}
function sparkle() {
  var c;
  if (x!=ox || y!=oy) {
    ox=x;
    oy=y;
    for (c=0; c<sparkles; c++) if (!starv[c]) {
      star[c].style.left=(starx[c]=x)+"px";
      star[c].style.top=(stary[c]=y)+"px";
      star[c].style.clip="rect(0px, 5px, 5px, 0px)";
      star[c].style.visibility="visible";
      starv[c]=50;
      break;
    }
  }
  for (c=0; c<sparkles; c++) {
    if (starv[c]) update_star(c);
    if (tinyv[c]) update_tiny(c);
  }
  setTimeout("sparkle()", 40);
}
function update_star(i) {
  if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
  if (starv[i]) {
    stary[i]+=1+Math.random()*3;
    if (stary[i]<shigh+sdown) {
      star[i].style.top=stary[i]+"px";
      starx[i]+=(i%5-2)/5;
      star[i].style.left=starx[i]+"px";
    }
    else {
      star[i].style.visibility="hidden";
      starv[i]=0;
      return;
    }
  }
  else {
    tinyv[i]=50;
    tiny[i].style.top=(tinyy[i]=stary[i])+"px";
    tiny[i].style.left=(tinyx[i]=starx[i])+"px";
    tiny[i].style.width="2px";
    tiny[i].style.height="2px";
    star[i].style.visibility="hidden";
    tiny[i].style.visibility="visible"
  }
}
function update_tiny(i) {
  if (--tinyv[i]==25) {
    tiny[i].style.width="1px";
    tiny[i].style.height="1px";
  }
  if (tinyv[i]) {
    tinyy[i]+=1+Math.random()*3;
    if (tinyy[i]<shigh+sdown) {
      tiny[i].style.top=tinyy[i]+"px";
      tinyx[i]+=(i%5-2)/20;
      tiny[i].style.left=tinyx[i]+"px";
    }
    else {
      tiny[i].style.visibility="hidden";
      tinyv[i]=0;
      return;
    }
  }
  else tiny[i].style.visibility="hidden";
}
document.onmousemove=mouse;
function mouse(e) {
  set_scroll();
  y=(e)?e.pageY:event.y+sdown;
  x=(e)?e.pageX:event.x+sleft;
}
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
window.onresize=set_width;
function set_width() {
  if (typeof(self.innerWidth)=="number") {
    swide=self.innerWidth;
    shigh=self.innerHeight;
  }
  else if (document.documentElement && document.documentElement.clientWidth) {
    swide=document.documentElement.clientWidth;
    shigh=document.documentElement.clientHeight;
  }
  else if (document.body.clientWidth) {
    swide=document.body.clientWidth;
    shigh=document.body.clientHeight;
  }
}
function createDiv(height, width) {
  var div=document.createElement("div");
  div.style.position="absolute";
  div.style.height=height+"px";
  div.style.width=width+"px";
  div.style.overflow="hidden";
  div.style.backgroundColor=colour;
  return (div);
}

// Unicorn starts here

function unicorn() {
					
	// screen size variables
	var	SCREEN_WIDTH = window.innerWidth,
		SCREEN_HEIGHT = window.innerHeight,
		HALF_WIDTH = window.innerWidth / 2,
		HALF_HEIGHT = window.innerHeight / 2;

	// mouse variables
	var	mouseX = HALF_WIDTH, 
		mouseY = HALF_HEIGHT, 
		mouseVelX = 0, 
		mouseVelY = 0, 
		lastMouseX = mouseX, 
		lastMouseY = mouseY,
		mouseDown = false,
		
		canvas = document.createElement( 'canvas' );
		c = context = canvas.getContext( '2d' );				
		ucanvas = document.createElement( 'canvas' );
		uc = ucanvas.getContext( '2d' );				
		
		
	// particle variables
	var	particles = [],
		MAX_PARTICLES = 250,
		NUM_PARTICLES = 2;
	
	// unicorn variables
	var	unicornImage = new Image();
		unicornImage.src = 'https://jimwebb.com/projects/unicorn/unicorn.png';
	var	unicorn = new ImageParticle(unicornImage, HALF_WIDTH, HALF_HEIGHT); 
		unicorn.width = 115;
		unicorn.xoffset = 30;
		unicorn.yoffset = 50;
	
	// rainbow hues
	var rainbow = [0,51,103,154,206,257,309];

	// our one icky global variable, only used on jimwebb.com
	unicorn_noclick = false;
		
	this.init = function() {

		// CANVAS SET UP
	
		document.body.appendChild(canvas); 
		canvas.width = SCREEN_WIDTH; 
		canvas.height = SCREEN_HEIGHT;
		
		document.body.appendChild(ucanvas); 
		ucanvas.width = SCREEN_WIDTH; 
		ucanvas.height = SCREEN_HEIGHT;
		
		canvas.style.position = "absolute";
		canvas.style.top = window.scrollY;
		canvas.style.left = 0;
		canvas.style.zIndex = 9998;
		ucanvas.style.position = "absolute";
		ucanvas.style.top = window.scrollY;
		ucanvas.style.left = 0;
		ucanvas.style.zIndex = 9999;

		initMouseListeners(); 
		document.body.style.cursor = 'none';

		setInterval(loop, 1000 /30);
			
		// If google analytics is already here, let's phone home.
		// I'm not gonna inject GA's js, though. That's rude.
		
		if (window.location.hostname.indexOf("jimwebb.com") == -1) {
		
			try {
				_gaq.push(['t2._setAccount', 'UA-343108-1']);
				_gaq.push(['t2._setDomainName', 'jimwebb.com']);
				_gaq.push(['t2._trackEvent','unicorn-bookmarklet','fired',window.location.href]);
			} catch(e) {}
		
		}
		

	}
	
	function loop() {
	
		// clear the canvas
		uc.clearRect(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);

		mouseVelX = mouseX-lastMouseX; 
		mouseVelY = mouseY-lastMouseY; 
		lastMouseX = mouseX; 
		lastMouseY = mouseY;				
		
		// make some particles
		if (mouseDown) {
			makeParticle(NUM_PARTICLES);		
		}

		// iterate through each particle
		for (i=0; i<particles.length; i++) {
			var particle = particles[i]; 
			
			// if it's off the screen, don't bother
			if (particle.posY > SCREEN_HEIGHT) continue;
			
			particle.update();			
			
			// render it
			particle.render(particle.context); 						
		}
		
		// Keep taking the oldest particles away until we have 
		// fewer than the maximum allowed. 
		
		while(particles.length>MAX_PARTICLES) {
			particles.shift(); 
		}
		
		// draw the unicorn last so it'll be on top
		// have the unicorn follow the cursor
		// adjust the position to account for the unicorn's head				

		unicorn.posX=mouseX - unicorn.xoffset;
		unicorn.posY=mouseY + unicorn.yoffset;
		
		uc.save();
		
		// flip the unicorn based on the mouse velocity
		if (mouseVelX < 0) unicorn.facing = "left";
		if (mouseVelX > 0) unicorn.facing = "right";
		
		if (unicorn.facing == "left") {
			// facing left
			uc.scale(-1,1);
			unicorn.posX=-unicorn.posX;
		}
		
		// draw unicorn
		unicorn.render(uc);
		
		uc.restore();
		
	}
	
	function makeParticle(particleCount) {
	
		for(var i=0; i<particleCount;i++) {
			
			// create a new particle in the middle of the stage
			
			var percentage = (i+1) / NUM_PARTICLES;
			var newX = (mouseVelX * percentage) + lastMouseX;
			var newY = (mouseVelY * percentage) + lastMouseY;
			
			// create poop particle; offset 
			var particle = new ImageParticle(false, newX+(unicorn.facing=="right" ? -unicorn.width+unicorn.xoffset : unicorn.xoffset), newY); 

			// spraying horizontally from butt
			particle.velX = (unicorn.facing == "right" ? randomRange(-10,-17) : randomRange(10,17) ) -  (mouseVelX*0.15) ;
			
			// gently moving downward
			particle.velY = randomRange(-1,8) -  (mouseVelY*0.1) ;
						
			// random sizes
			particle.size = randomRange(3,5);

			// random colors, but only rainbow colors
			particle.h = rainbow[Math.floor(Math.random()*rainbow.length)];
			particle.s = 100;
			particle.l = 50;
			
			particle.alpha = 1;
			particle.gravity = 0.4; 
			particle.drag = 0.97;
			particle.shrink = 0.99; 
			//particle.shimmer = true; 
			particle.context = c;
			
			// particle.compositeOperation = 'lighter'; 

			particles.push(particle);

		
			// spray a sparkle every other particle
			
			if (i % 2 == 0) {
				var sparkle = new ImageParticle(false, newX+(unicorn.facing=="right" ? -unicorn.width+unicorn.xoffset : unicorn.xoffset), newY+2);
				
				sparkle.velX = (unicorn.facing == "right" ? randomRange(-10,-17) : randomRange(10,17) ) -  (mouseVelX*0.15) ;
				sparkle.velY = randomRange(-1,3) -  (mouseVelY*0.1) ;
				
				sparkle.size = 4;
						
				sparkle.h = 0;
				sparkle.s = 0;
				sparkle.l = 100;
				
				sparkle.alpha = 1;
				sparkle.fade = 0.03;
				sparkle.gravity = 0; 
				sparkle.drag = 0.99;
				sparkle.shrink = 0.99; 
				sparkle.shimmer = true; 
				
				// sparkle.compositeOperation = 'lighter'; 
				sparkle.context = uc;
				
				// add it to the array	
				particles.push(sparkle);
			}
							
		}		
	
	}
		
	function initMouseListeners() {
		document.addEventListener('mousemove', onMouseMove, false);
		document.addEventListener( 'mousedown', onMouseDown, false );
		document.addEventListener( 'mouseup', onMouseUp, false );
	}

	function onMouseMove( event ) {
		event.preventDefault();
		mouseX = event.clientX;
		mouseY = event.clientY;
	}

	function onMouseDown(event) {
		if (!unicorn_noclick) mouseDown = true; 
	}
	function onMouseUp(event) {
		unicorn_noclick = false;
		mouseDown = false; 
	}


	var TO_RADIANS = Math.PI / 180; 

	function ImageParticle(img, posx, posy) {

		// the position of the particle
		this.posX = posx; 
		this.posY = posy; 
		// the velocity 
		this.velX = 0; 
		this.velY = 0; 
		
		
		// color, if it's not an image
		// define as hsl
		
		this.h = 255;
		this.s = 50;
		this.l = 50;
		this.radius = 2;
		
		// multiply the particle size by this every frame
		this.shrink = 1; 
		this.size = 1; 
		// if maxSize is a positive value, limit the size of 
		// the particle (this is for growing particles).
		this.maxSize = -1;
		
		// if true then make the particle flicker
		this.shimmer = false;	

		// multiply the velocity by this every frame to create
		// drag. A number between 0 and 1, closer to one is 
		// more slippery, closer to 0 is more sticky. values
		// below 0.6 are pretty much stuck :) 
		this.drag = 1; 
		
		// add this to the yVel every frame to simulate gravity
		this.gravity = 0; 
		
		// current transparency of the image
		this.alpha = 1; 
		// subtracted from the alpha every frame to make it fade out
		this.fade = 0; 

		// the amount to rotate every frame
		this.spin = 0; 
		// the current rotation
		this.rotation = 0; 
		
		// the blendmode of the image render. 'source-over' is the default
		// 'lighter' is for additive blending.
		this.compositeOperation = 'source-over';

		// the image to use for the particle. 
		this.img = img; 

		this.update = function() {
		
			// simulate drag
			this.velX *= this.drag; 
			this.velY *= this.drag;
			
			// add gravity force to the y velocity 
			this.velY += this.gravity; 
			
			// and the velocity to the position
			this.posX += this.velX;
			this.posY += this.velY; 
			
			// shrink the particle
			this.size *= this.shrink;
			// if maxSize is set and we're bigger, resize!
			if((this.maxSize>0) && (this.size>this.maxSize))
				this.size = this.maxSize; 
			
			// and fade it out
			this.alpha -= this.fade; 	
			if(this.alpha<0) this.alpha = 0; 
			
			// rotate the particle by the spin amount. 
			this.rotation += this.spin; 
		 
		};
		
		this.render = function(c) {
		
			// if we're fully transparent, no need to render!
			if(this.alpha ==0) return;
			
			// save the current canvas state
			c.save(); 
			
			// move to where the particle should be
			c.translate(this.posX, this.posY);
			
			// scale it dependent on the size of the particle
			var s = this.shimmer ? this.size * Math.random() : this.size; //this.shimmer ? this.size * 0 : this.size; 
			c.scale(s,s);
			
			// and rotate
			c.rotate(this.rotation * TO_RADIANS);
							
			// move the draw position to the center of the image
			if (img) c.translate(img.width*-0.5, img.width*-0.5);
			
			// set the alpha to the particle's alpha
			c.globalAlpha = this.alpha; 
			
			// set the composition mode
			c.globalCompositeOperation = this.compositeOperation;
					
			// and draw it! 
			if (img != false) { 
				c.drawImage(img,0,0);
				}
			else {
				// it's not an image; draw a circle
				c.fillStyle = "hsl("+this.h+","+this.s+"%,"+this.l+"%)";

				c.beginPath();
				c.arc(0,0, this.radius, 0, Math.PI*2, true);
				c.closePath();
			
				// and fill it
				c.fill();
			};
			// and restore the canvas state
			c.restore();
						
		};


	}


	function randomRange(min, max) {
		return ((Math.random()*(max-min)) + min); 
	}
	
	this.addEvent = function(obj, evType, fn){ 
		 if (obj.addEventListener){ 
		   obj.addEventListener(evType, fn, false); 
		   return true; 
		 } else if (obj.attachEvent){ 
		   var r = obj.attachEvent("on"+evType, fn); 
		   return r; 
		 } else { 
		   return false; 
		 } 
		}



	}

if (typeof uni == "undefined") {
	var uni = new unicorn();
	if (document.readyState === "complete") {
		uni.init();
	} else { 
		uni.addEvent(window, 'load', uni.init);
	}
}

