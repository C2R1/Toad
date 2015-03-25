use <parts.scad>

$fn=200;

module frontSuspension(print = false)
{
  if(print)
  {
  }
  else
  {
    translate([0,-3.5,-1.5])
    frontSuspensionLowerArm();
    translate([0,-5,20])
    frontSuspensionUpperArm();
    translate([0,0,0])
    frontSuspensionPivot();
  }
}

module frontSuspensionLowerArm()
{
  l=20;
  w=7;
  h=3;
  difference()
  {
    union()
    {
      cube([l,w,h]);
      translate([l,w/2,0]) cylinder(r=w/2,h=h);
      translate([0,0,h/2]) rotate([-90,0,0]) cylinder(r=h/2,h=w);
    }
    translate([l,w/2,-1]) cylinder(r=2,h=h+2);
    translate([0,-1,h/2]) rotate([-90,0,0]) cylinder(r=1,h=w+2);
  }
}

module frontSuspensionUpperArm()
{
  h=3.5;
  w=10;
  l=17;
  
  centerX = 2;
  centerW = 5;
  centerL = l-centerX+h;
  centerH = h+2;
  
  axisradius = 1;
  
  difference()
  {
    union()
    {
      cube([l,w,h]);
      translate([0,0,h/2])
        rotate([-90,0,0]) cylinder(r=h/2,h=w);
      translate([l,0,h/2])
        rotate([-90,0,0]) cylinder(r=h/2,h=w);
    }
    
    for(x=[0,10])
      translate([x,-1,h/2])
        rotate([-90,0,0]) cylinder(r=axisradius,h=w+2);
    
    translate([centerX+centerW/2, w/2-centerW/2,-1])
      union()
      {
        cube([centerL,centerW,centerH]);
        translate([0,centerW/2,0]) cylinder(r=centerW/2, h=centerH);
      }
  }
  translate([l,0,h/2])
    rotate([-90,0,0]) cylinder(r=axisradius,h=w);
}

module frontSuspensionPivot(print=false)
{
  l=30;
  w=30;
  h=3;
  
  offsetX = -10;
  offsetY = -w/2;
  offsetZ = 0;
  
//  translate([offsetX,offsetY,offsetZ])
  {
    translate([-l,-w/2,0])
      cube([l,w,h]);
    
    if(!print)
      translate([-13,0,h])
        rotate([0,0,-90])
          motorBlock();
  }
}

frontSuspensionPivot(print=false);
