$fn=100;

module servoMotor(screwGuides = false)
{
    cube([40.7,19.8,33.6]);
    translate([-6.5,0.4,26.6])
    difference()
    {
        union()
        {
            cube([53.36,19,2.35]);
            translate([0,9.19,2.35])
            difference()
            {
                cube([53.36,1,1.5]);
                rotate([0,-35,0])
                translate([-1,-1,0])
                cube([10,3,10]);
                translate([53.36,0,0])
                rotate([0,35,0])
                translate([-9,-1,0])
                cube([10,3,10]);
            }
        }
        
    }
}

module motorBlock()
{
	translate([-7.45,-4.25,0])
	{
		color("white")
		motorBracket();
		translate([1.5,-6.7,0])
		motor();
	}
}

module motorBracket()
{
	difference()
	{
		union()
		{
			cube([15,17.3,11.5]);
			for(x=[-1.55,16.45])
			{
				difference()
				{
					translate([x,4.25,0])
					cylinder(r=4.25,h=3);
					translate([x,4.25,1])
					cylinder(r=2.05,h=6,center=true);
				}
			}
		}
		translate([1.45,-1,-1.45])
		cube([12.1,19,11.5]);
	}
	
}

module motor()
{
	color("silver")
	intersection()
	{
		translate([6,15,5])
		rotate([90,0,0])
		cylinder(r=6,h=15);
		cube([12,15,10]);
	}

	color("goldenrod")
	translate([0,15,0])
	cube([12,9,10]);
	
	color("silver")
	translate([6,24,5])
	difference()
	{
		rotate([-90,0,0])
		cylinder(r=1.5,h=9.27);
		translate([-1.5,-0.5,1])
		cube([3,10,1]);
	}
}

module arduino()
{
	color("darkturquoise")
	difference()
	{
		cube([53.3,68.6,1]);
		for(pos =[	[2.5,14,-0.5],
					[50.8,15.3,-0.5],
					[17.7,66.1,-0.5],
					[45.7,66.1,-0.5]])
		{
			translate(pos)
			cylinder(r=1.25,h=2);
		}
		translate([-1,65,-1])
		cube([14,4,3]);
		translate([51.3,65,-1])
		cube([3,4,3]);
		translate([13,65,-1])
		rotate([0,0,45])
		cube([5,5,3]);
		translate([51.3,65,-1])
		rotate([0,0,45])
		cube([5,5,3]);
	}
	color("silver")
	translate([9.6,-6.2,1.6])
	cube([12,15,10.9]);

	color("silver")
	translate([41.1,-1.8,1.6])
	cube([8.9,14,10.9]);
}

module raspberryPi()
{
	color("darkgreen")
	cube([56,85,1.6]);

	color("silver")
	translate([2,-1,1.6])
	cube([15.4,21.8,13]);

	color("silver")
	translate([37.2,-7.7,1.6])
	cube([13.25,17.2,15.3]);

	color("black")
	translate([44.6,14,1.6])
	{
		cube([11.4,12,10.2]);
		translate([11.4,6,3.35+3])
		rotate([0,90,0])
		cylinder(r=3.35,h=3.4);
	}

	color("silver")
	translate([-1.2,32.4,1.6])
	cube([11.4,15.1,6.15]);

	color("silver")
	translate([3.6,79.9,1.6])
	cube([7.6,5.6,2.4]);

	translate([43.9,34.4,1.6])
	{
		color("yellow")
		cube([10,9.8,13]);

		color("silver")
		translate([10,4.9,8.15])
		rotate([0,90,0])
		cylinder(r=4.15,h=8.9);
	}

	color("black")
	translate([49.5, 50.8,1.6])
	cube([5,33.2,1]);

	color("black")
	translate([16.7,66,-5])
	cube([27.8,19,5]);
}

servoMotor();
