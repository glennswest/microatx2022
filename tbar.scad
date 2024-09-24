include <microatxmini.scad>

plen = 89.7;

module tbar_body()
{
    translate([4,-45,0]) cube([7,plen+60,7]); 
    translate([b_w-4,-45,0]) cube([7,plen+60,7]);
    translate([7,0,0]) cube([b_w-4,14,7]);;
}

module tbar_holes()
{
    for (i = [-60+25.5 : 25.5 : 95]){
        translate([-1,i+3.5,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([b_w-8,i+3.5,3.5])  rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([9,i+3.5,3.5]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        translate([b_w-4.1,i+3.5,3.5]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        }     

}

module tbar()
{
    difference(){
        tbar_body();
        tbar_holes();
        }
}

tbar();