use <parts.scad>
use <wheel.scad>

$fn=50;

module completedMotorProtection(angle)
{
	rotate([0,0,angle])
	{
		color("darkRed")
		motorProtection();
		translate([0,0.55,1])
		rotate([0,0,180])
		motorBlock();
		translate([0,-10,6])
		rotate([0,0,-90])
		wheel();
	}
}

module rearWheel()
{
	translate([0,0.55,1])
	rotate([0,0,180])
	motorBlock();
	translate([0,-10,6])
	rotate([0,0,-90])
	wheel();
}

module motorProtection()
{
	//bottom side
	difference()
	{
		union()
		{
			translate([-13.5,0,0])
			cube([27,13.5,1]);
			cylinder(r=13.5,h=1);
		}
		translate([-9,0.55,-1])
		cylinder(r=1.1, h=3, $fn=100);
		translate([9,0.55,-1])
		cylinder(r=1.1, h=3, $fn=100);
	}

	//top side
	translate([0,0,13.5])
	union()
	{
		translate([-13.5,0,0])
		cube([27,13.5,1]);
		cylinder(r=13.5,h=1);
	}

	//walls
	translate([-3,-3,1])
	{
		for(x=[-10.5,10.5])
		{
			translate([x,8.5,0])
			cube([6,8,12.5]);
		}
	}

	//rotation axis
	translate([0,0,-8])
	cylinder(r=2,h=8,$fn=100);
	translate([0,0,12.5])
	cylinder(r=2,h=8,$fn=100);
}

module directionAxis()
{
	difference()
	{
		union()
		{
			cube([28,10,15.7]);
			translate([4,0,0])
			cube([20,30,1]);
			translate([14,30,0])
			cylinder(r=10,h=1,$fn=100);
		}
		translate([14,30,0])
		cylinder(r=2.1,h=3,center=true,$fn=100);
		translate([7,5,-1])
		{
			cylinder(r=2.6,h=17,$fn=100);
			translate([14,0,0])
			cylinder(r=2.6,h=17,$fn=100);
		}
		translate([14,0,0])
		for(x=[-14,14])
		{		
			translate([x,30,0])
			rotate([90,0,0])
			{
				cylinder(r=4,h=31);
				sphere(r=4);
			}
		}
		translate([14,-1,10])
		rotate([-90,0,0])
		cylinder(r=2,h=12);
	}
}

module direction(angle)
{
	translate([-14,0,0])
	{
		translate([28,0,15.7])
		rotate([0,180,0])
		directionAxis();
		translate([14,30,0.1])
		rotate([0,0,180])
		completedMotorProtection(angle);
	}
}

direction(2*50*abs(0.5-$t) -25);