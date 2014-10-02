use <spring.scad>

$fn=200;

module shockAbsorber()
{
    color("silver")
    spring(r1 = 9.1, r2 = 0.7, h = 34.9, hr = 2);
}

module strut()
{
    //McPherson Strut
    shock();
}

module shock()
{
    translate([0,0,0])
    {
        color("silver")
        translate([0,0,2])
        spring(r = 4.75, r2 = 0.4, h = 19.1, twists = 3); //d = 9.5
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
        }
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
}

strut();
