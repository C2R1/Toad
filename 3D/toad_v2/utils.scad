pi=3.14159;

module goupille(L=67,L1=20,r=1.5,d=13, fn=$fn)
{
//  cylinder(r=d/2,h=r);
  rotate_extrude(convexity=10)
    translate([d,0,0])
      circle(r=r);
          
  //sin part
//  offsetX = 0;
//  for(i=[0:2*360])
//    translate([i*10,0,0])
//      cube([10,10,200+200*cos(i+offsetX)]);
}

//A=25,B=27,D=13,d=3,L=67
goupille();

module quarterCircle(r=10,h=1,invert=false,expand=false)
{
  if(invert)
  {
    translate([-r,-r,0])
    {
      if(expand)
      {
        difference()
        {
          cube([r+1,r+1,h]);
          translate([0,0,-1])
          cylinder(r=r,h=h+2);
        }
      }
      else
      {
        difference()
        {
          cube([r,r,h]);
          translate([0,0,-1])
          cylinder(r=r,h=h+2);
        }
      }
    }
  }
  else
  {
    difference()
    {
      cylinder(r=r,h=h);
      translate([-r,-r,-1])
      {
        cube([2*r,r,h+2]);
        cube([r,2*r,h+2]);
      }
    }
  }
}
