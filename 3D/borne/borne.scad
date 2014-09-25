module screenPanel() { //DONE
	difference(){
		cube([5, 588, 400]);
		translate([2,244,150])
		rotate([90,0,90])
		union() {//M4 screws (FDMI 100x100)
			cylinder(h=7, d=4, center=true);
			translate([100,0,0])
			cylinder(h=7, d=4, center=true);
			translate([0,100,0])
			cylinder(h=7, d=4, center=true);
			translate([100,100,0])
			cylinder(h=7, d=4, center=true);
		}
	}
}

module seat() {//DONE (TODO: leg)
	translate([100,0,540])
	union(){
		//backrest
		color("grey")
		cube([400,20,200]);

		//tubes
		color("silver")
		translate([30,0,0])
		union(){
			union(){
				cylinder(h=300,r=10,center=true);
				translate([340,0,0])
				cylinder(h=300,r=10,center=true);
			}
			translate([0,0,-150])
			union(){
				sphere(r=10);
				translate([340,0,0])
				sphere(r=10);
			}
			translate([0,150,-150])
			rotate([90,0,0])
			union(){
				cylinder(h=300,r=10,center=true);
				translate([340,0,0])
				cylinder(h=300,r=10,center=true);
			}
			translate([170,300,-150])
			rotate([90,0,90])
			union(){
				cylinder(h=340,r=10,center=true);
				translate([0,0,-170])
				sphere(r=10);
				translate([0,0,170])
				sphere(r=10);
			}
		}

		//cushion
		color("grey")
		translate([0,15,-140])
		cube([400,310,40]);

		//leg
		translate([125,20,-540])
		difference(){
			cube([150,200,400]);
			translate([45,-10,-1])
			cube([60,220,32]);
		}
	}
}

module seatTrack(){
	difference(){
		cube([60,1500,30]);
		translate([30,0,15])
		union(){
			for(y=[1:30]){
				translate([0,20*y,0])
				cylinder(r=5,h=32,center=true);
			}
		}
	}
}

module floor(){
	module floorPanel(){
		//color("brown")
		translate([0,0,31])
		difference(){
			cube([600,800,10]);
			translate([0,0,-1])
			//dados
			union(){
				//lower x dados
				translate([-1,0-1,0])
				cube([11,802,5]);
				translate([260,-1,0])
				cube([10,802,5]);
				translate([330,-1,0])
				cube([10,802,5]);
				translate([590,-1,0])
				cube([11,802,5]);
		
				//lower y dados
				translate([10,-1,0])
				cube([250,11,5]);
				translate([340,-1,0])
				cube([250,11,5]);
				translate([10,400,0])	
				cube([250,10,5]);
				translate([340,400,0])
				cube([250,10,5]);
				translate([10,791,0])
				cube([250,11,5]);
				translate([340,791,0])
				cube([250,11,5]);

				//upper dados
				translate([0,0,6])
				union(){
					//upper x dados
					translate([-1,790,1])
					cube([602,11,5]);
					translate([-1,580,1])
					cube([602,10,5]);
				}
			}
		}
	}

	module floorSupport(){
		//y supports
		cube([10,800,35]);
		translate([260,0,0])
		cube([10,800,35]);
		translate([330,0,0])
		cube([10,800,35]);
		translate([590,0,0])
		cube([10,800,35]);

		//x supports
		translate([10,0,0])
		cube([250,10,35]);
		translate([340,0,0])
		cube([250,10,35]);
		translate([10,400,0])	
		cube([250,10,35]);
		translate([340,400,0])
		cube([250,10,35]);
		translate([10,790,0])
		cube([250,10,35]);
		translate([340,790,0])
		cube([250,10,35]);
	}
	floorPanel();
	floorSupport();
}

module insideCase(){
	translate([0,580,0])
	cube([588,10,450]);
}

module steeringWheelCase(){
	cube([588,250,10]);
	translate([0,115,210])
	cube([588,135,10]);
	translate([0,0,0])
	rotate([60,0,0])
	difference(){
		cube([588,250,10]);
		translate([241.5,86,0])
		union(){
			translate([-10,-10,-2])
			cube([125,98,8]);
			translate([0,0,5])
			union(){
				cylinder(h=12,r=2.5,center=true);
				translate([52.5,0,0])
				cylinder(h=12,r=2.5,center=true);
				translate([105,0,0])
				cylinder(h=12,r=2.5,center=true);
	
				translate([0,62,0])
				cylinder(h=12,r=2.5,center=true);
				translate([52.5,78,0])
				cylinder(h=12,r=2.5,center=true);
				translate([105,62,0])
				cylinder(h=12,r=2.5,center=true);
	
				translate([40,6.5,0])
				union(){
					cylinder(h=12,r=5,center=true);
					translate([25,0,0])
					cylinder(h=12,r=5,center=true);
				}
			}
			translate([0,6.5,-1])
			union(){
				cube([105,50,12]);
				translate([52.5,-11,0])
				difference(){
					cylinder(r=75,h=12);
					translate([-75,-100,-1])
					cube([150,160,14]);
				}
			}
		}
		translate([488,70,-1])
		cylinder(r=7.5,h=12);
	}
}

module fullStation(){
	floor();
	translate([6,0,37])
	insideCase();
	translate([6,350,480])
	steeringWheelCase();
	translate([6,600,690])
	rotate([0,0,-90])
	screenPanel();
}

fullStation();
translate([270,-700,0])
seatTrack();
translate([0,-300,0])
seat();