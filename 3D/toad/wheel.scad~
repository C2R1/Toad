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
			for(a=[0:10:340])
			{
				rotate([a,90,0])
				translate([0,0,3])
				cylinder(r=0.5, h=26.5, center=false, $fn=50); 
			}
			for(a=[5:10:350])
			{
				rotate([a,90,0])
				translate([0,0,3])
				rotate([0,25,0])
				cylinder(r=0.5, h=35, center=false, $fn=50); 
			}
		}
	}
}

wheel();