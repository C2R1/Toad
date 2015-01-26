use <spring.scad>


$fn=200;

module shockAbsorber()
{
    color("silver")
    spring(r1 = 9.1, r2 = 0.7, h = 34.9, hr = 2);
}

module BottomShockAbsorber()
{
    color("Peru")
    difference()
    {    
        union()
        {
            difference()
            {
                cylinder(r=6, h=3);
                translate([0,0,2])
                cylinder(r=5,h=2);
            }
            translate([0,0,-18])
            cylinder(r=3.8, h=30);
        }
        translate([0,0,-19])
        cylinder(r=2, h=32);
        translate([0,0,-13])
        rotate([0,90,0])
        cylinder(r=1,h=20,center=true);
    }
}

module TopShockAbsorber()
{
    color("teal")
    {
        translate([0,0,21.1])
        difference()
        {
            cylinder(r=6, h=3);
            translate([0,0,-1])
            difference()
            {
                cylinder(r=5,h=2);
                cylinder(r=3.8, h=2);
            }
        }
        translate([0,0,-10])
        cylinder(r=2,h=32);
    }
}

module strut()
{
    x = 7;
    y = 60;
    z = 5;
    a = 20;
    d1 = 3;
    //McPherson Strut
    translate([0,0,20])
    shock(compression = 10*$t);
    translate([0,0,0])
    triangle(_x=x,_y=y,_z=z,_a=a,_d1=d1);
}

module triangle(_x,_y,_z,_a,_d1)
{
    translate([0,-_y*cos(_a),-_z/2])
    {
        arm(x=_x,y=_y,z=_z,a=_a,d1=_d1);
        arm(x=_x,y=_y,z=_z,a=-_a,d1=_d1);
        translate([0,_y*cos(_a),_z/2])
        rotate([0,90,0])
        cylinder(r=1.5,h=2*_y*sin(_a)-5,center=true);
    }
}

module arm(x,y,z,a,d1)
{
    rotate([0,0,a])
    difference()
    {
        union()
        {
            translate([-x/2,0,0])
            cube([x,y,z]);
            cylinder(r=x/2,h=z);
            translate([0,y,0])
            cylinder(r=x/2,h=z);
        }
        translate([0,y,-1])
        cylinder(r=d1/2,h=z+2);
    }
    
    
}


module shock(compression = 0)
{
    translate([0,0,0])
    {
        color("silver")
        translate([0,0,2+compression])
        spring(r = 4.75, r2 = 0.4, h = 19.1-compression,
                twists = 3+1/3*compression); //d = 9.5
        translate([0,0,compression])
        BottomShockAbsorber();
        TopShockAbsorber();
    }
}

strut();
