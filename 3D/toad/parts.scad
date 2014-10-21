$fn=200;

module screwGuide()
{
    color("gold")
    difference()
    {
        union()
        {
            cylinder(r=1.52, h=5.77);
            translate([0,0,5.37]) cylinder(r=2.5, h=0.4);
        }
        translate([0,0,-1]) cylinder(r=1.22, h=7);
    }    
}

module vibrationAttenuation()
{
    color("grey")
    difference()
    {
        union()
        {
            cylinder(r=2.02, h=5.7);
            for(z=[0,4])
                translate([-3.275,-4.46,z]) cube([6.55,8.92,1.7]);
        }
        translate([0,0,-1]) cylinder(r=1.515,h=7);
    }
}

module servoMoteurPivot()
{
    w1=8.89;
    w2=4.78;
    l=33.88;
    color("lightgrey")
    {
        difference()
        {
            cylinder(r=8.87/2, h=4.39);
            translate([0,0,-1]) cylinder(r=5.39/2, h=6);
        }
        translate([0,0,4.39])
        {
            difference()
            {
                union()
                {
                    difference()
                    {
                        translate([-l/2,-w1/2,0])cube([l,w1,2]);
                        translate([0,w1/2,-1]) rotate([0,0,-10]) cube([20,10,4]);
                        translate([0,w1/2,-1]) rotate([0,0,100]) cube([10,20,4]);
                        translate([0,-w1/2,-1]) rotate([0,0,170]) cube([20,10,4]);
                        translate([0,-w1/2,-1]) rotate([0,0,280]) cube([10,20,4]);
                    }
                    translate([0,0,2]) cylinder(r=7.57/2, h=0.70);
                }
                translate([0,0,2.70-1.33]) cylinder(r=5.98/2, h=2.33);
                translate([0,0,-1]) cylinder(r=2.76/2, h=3);
                for(j=[-1,1])
                    for(i=[0,1,2])
                        for(x=[j*(l/2-1.9-1.3/2-i*(1.03+1.3))])
                            translate([x,0,-1]) cylinder(r=1.3/2, h=4);
            }
        }
    }
}

module servoMotor(screwGuides = false)
{
    d=4.36;
    xC=4.76-(d/2);
    yC=(d/2)+2.36;
    X=[xC,53.36-xC];
    Y=[yC,19-yC];
    w=2.66;
    
    cube([40.7,19.8,33.6]);
    translate([-6.5,0.4,26.6])
    {
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
            for(x=X)
                for(y=[yC,19-yC])
                    translate([x,y,-1]) cylinder(r=d/2, h=4);
            for(x=[-2,51])
                for(y=Y-[w/2,w/2])
                    translate([x,y,-1]) cube([4,w,4]);
        }
        if(screwGuides)
        for(x=X)
            for(y=Y)
            {
                translate([x,y+0.1,-1.65]) 
                {
                    vibrationAttenuation();
                    translate([0,0,0.4]) screwGuide();
                }
            }
    }
    translate([0,0,33.6])
    {
        translate([0.6+9.42,9.42+(19.8-18.84)/2,0])
        {
            cylinder(r=9.42, h=2.36);
            translate([0,0,2.36]) cylinder(r=6.47,h=2.22);
            translate([0,0,4.58]) color("lightgrey") cylinder(r=5.73/2, h=3.5);
            translate([0,0,4.58]) servoMoteurPivot();
        }
        translate([0,(19.8-17.82)/2,0])
        {
            translate([40.7-23.5-5.97,0,0]) cube([23.5,17.82,2.36]);
            translate([40.7-17.82/2-3.70,17.82/2,0]) cylinder(r=17.82/2, h=2.36);
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

servoMotor(screwGuides=true);
