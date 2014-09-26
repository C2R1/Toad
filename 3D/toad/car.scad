use <wheel.scad>
use <direction.scad>
use <parts.scad>
use <chassis.scad>
use <spring.scad>

$fn=100;

module car()
{
    chassis();
    for(m=[0,1]) //wheels / motors / ...
    {
        mirror([m,0,0])
        translate([60,466,5])
        rotate([0,0,-90])
        direction((2*m-1)*(2*50*abs(0.5-$t) -25));
        mirror([m,0,0])
        translate([90,143,5])
        rotate([0,0,90])
        rearWheel();
    }
    // translate([0,0,10])
    // rotate([0,0,0])
    // raspberryPi();
    // translate([-70,0,15])
    // rotate([0,0,0])
    // arduino();
}

car();
