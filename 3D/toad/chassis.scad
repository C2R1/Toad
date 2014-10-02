$fn = 100;

module chassis()
{
    translate([0,350,0])
    union()
    {
        color("lightblue")
        chassisFrontRight();
        color("Blue")
        chassisFrontSeparator();
        color("steelblue")
        chassisFrontLeft();
    }
    translate([-105,200,0]) color("darkblue") chassisCenter();
    union()
    {
        color("lightblue")
        chassisBackRight();
        color("blue")
        chassisBackSeparator();
        color("steelblue")
        chassisBackLeft();
    }
}

module chassisFrontRight()
{
    color("grey")
    difference()
    {
        union()
        {
            difference()
            {
                translate([15,0,0])
                cube([90,200,5]); //chassis base
                translate([70,70,-1])
                cube([40,90,7]); //wheel space
            }
            
            //jointing
            translate([5,-10,1.5])
            cube([100,10,2]);
            translate([5,0,1.5])
            cube([10,200,2]);
            
            //front wheel support
            translate([60,130,0])
            rotate([0,0,-90])
            difference()
            {
                union()
                {
                    cube([28,30,5]);
                    translate([14,30,0])
                    cylinder(r=14,h=5);
                }
                translate([14,30,-1])
                cylinder(r=2.1,h=7);
            }
            
            //front wheel protection
//            translate([65,115,5])
//            difference()
//            {
//                rotate([0,90,0])
//                cylinder(r=50,h=40);
//                translate([5,0,0])
//                rotate([0,90,0])
//                cylinder(r=45,h=36);
//                translate([-1,-55,-55])
//                cube([45,110,50]);
//                translate([-1,-14,0])
//                cube([6.1,30,55]);
//            }
        }
    
        translate([65,123,-1])
        {
            cylinder(r=2.6,h=7);
            translate([0,-14,0])
            cylinder(r=2.6,h=7);
        }
    }
    
    //front bumper support
    translate([0,200,0])
    difference()
    {
        color("grey")
        rotate([0,0,-10])
        translate([-10,0,0])
        cube([125,20,5]);
        translate([-10,-5,-1])
        cube([10,30,7]);
        translate([105,-20,-1])
        cube([20,30,7]);
        translate([0,-20,-1])
        cube([105,20,7]);
    }
}

module chassisBackRight()
{
    color("grey")
    difference()
    {
        union()
        {
            //chassis base
            difference()
            {
                translate([15,0,0])
                cube([90,200,5]);
                translate([80,98,-1])
                cube([28,90,7]); //wheel hole
            }
    
            //jointing
            translate([5,200,1.5])
            cube([100,10,2]);
            translate([5,0,1.5])
            cube([10,200,2]);
            
            //rear wheel support
            translate([90,143,0])
            rotate([0,0,90])
            difference()
            {
                union()
                {
                    translate([-13.5,0,0])
                    cube([27,13.5,5]);
                    cylinder(r=13.5,h=5);
                }
                translate([-9,0.55,-1])
                cylinder(r=1.1, h=7);
                translate([9,0.55,-1])
                cylinder(r=1.1, h=7);
            }

            //rear wheel protection
//            translate([75,143,5])
//            difference()
//            {
//                rotate([0,90,0])
//                cylinder(r=50,30);
//                translate([5,0,0])
//                rotate([0,90,0])
//                cylinder(r=45,h=26);
//                translate([-1,-55,-55])
//                cube([35,110,50]);
//                translate([-1,0,6])
//                rotate([0,90,0])
//                cylinder(r=8,h=7);
//            }
        }
    }
}

module chassisFrontLeft()
{
    mirror([1,0,0])
    chassisFrontRight();
}

module chassisBackLeft()
{
    mirror([1,0,0])
    chassisBackRight();
}

module chassisCenter()
{
    difference()
    {
        cube([210,150,5]);
        translate([-1,-1,1.5])
        cube([212,11,2]);
        translate([-1,140,1.5])
        cube([212,11,2]);
    }
}

module chassisFrontSeparator()
{
    translate([-15,0,0])
    difference()
    {
        cube([30,200,5]);
        translate([-1,-1,1.5])
        cube([11,202,2]);
        translate([20,-1,1.5])
        cube([11,202,2]);
    }
}

module chassisBackSeparator()
{
    translate([-15,0,0])
    difference()
    {
        cube([30,200,5]);
        translate([-1,-1,1.5])
        cube([11,202,2]);
        translate([20,-1,1.5])
        cube([11,202,2]);
    }
}
