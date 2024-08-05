
/*
   Micro ATX
 */
b_w		= 243.84; /* x */
b_d		= 243.84; /* y */
b_h		= 45;     /* subjective height of the board - depends on fan/cards */
//b_hole_dia 	= 6.731;
b_hole_dia = 3.4;









module test_sizes()
{
     difference(){
      cube([7.5,30,7.5]);
      translate([3.75,15,-.1]) cylinder(r=3.4/2,h=9,$fn=128);
      translate([3.75,15,-.1]) cylinder(r=6/2,h=2,$fn=6);
      }
      

}

module standoff_core()
{
    difference(){
       cylinder(r=6/2,h=5,$fn=8);
       translate([0,0,-.1]) cylinder(r=3.4/2,h=5.2,$fn=200);
       }
}

module standoffs()
{
    translate([0, 0,0]) standoff_core();
    translate([0,10,0]) standoff_core();
    translate([0,20,0]) standoff_core();
    translate([0,30,0]) standoff_core();
    translate([0,40,0]) standoff_core();
    translate([10, 0,0]) standoff_core();
    translate([10,10,0]) standoff_core();
    translate([10,20,0]) standoff_core();
    translate([10,30,0]) standoff_core();
    translate([10,40,0]) standoff_core();

}

