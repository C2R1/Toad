$fn=100;

module wheel()
{
	rotate([0,90,0])
	{
		color("dimgrey")
		difference()
		{
			cylinder(r=35, h=25, center=true, $fn=200);
			cylinder(r=30, h=27, center=true, $fn=200);
		}
		color("silver")
		translate([0,0,10])
		{
		    difference()
		    {
		        cylinder(r=3.5, h=8, center=true, $fn=100);
		        cylinder(r=1.5, h=10, center=true, $fn=100);
		    }
		    translate([0,0,-1])
			difference()
			{
				union()
				{
				    cylinder(r1=30,r2=3.5, h=8, center=true);
				    translate([0,0,-6])
				    cylinder(r=30, h=2);
				}
				translate([0,0,-7])
				cylinder(r1=30,r2=3.5, h=8);
				cylinder(r=1.5, h=10, center=true);
				for(a=[0:60:360])
				{
				    rotate([0,0,a])
				    translate([0,25,-12])
				    cylinder(r=10,h=20, center=false);
				}
			}
//			for(a=[0:10:340])
//			{
//				rotate([a,90,0])
//				translate([0,0,3])
//				cylinder(r=0.5, h=26.5, center=false, $fn=50); 
//			}
//			for(a=[5:10:350])
//			{
//				rotate([a,90,0])
//				translate([0,0,3])
//				rotate([0,25,0])
//				cylinder(r=0.5, h=35, center=false, $fn=50); 
//			}
		}
	}
}

wheel();
