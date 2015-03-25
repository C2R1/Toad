$fn=8;

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
