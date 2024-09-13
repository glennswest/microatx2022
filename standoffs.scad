

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

standoffs();