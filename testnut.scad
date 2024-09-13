


$fn=100;



module test_sizes()
{
     difference(){
      cube([14,30,7.5]);
      translate([7.5,18,-.1]) cylinder(r=3.4/2,h=9,$fn=128);
      translate([7.5,18,-.1]) cylinder(r=6.8/2,h=2.6,$fn=6);
      translate([7.5,6,.6]) cylinder(r=10/2,h=3.2,$fn=128);
      }
      

}

rotate([180,0,0]) test_sizes();