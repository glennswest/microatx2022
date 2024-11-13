include <microatxmini.scad>

plen = 89.7;

module psutop_body()
{
    translate([7,6.7,0]) cube([b_w-2,97+4,4]);
    translate([30,30,-0.5]) rotate([0,0,90]) linear_extrude(.5) text( "psutop V130",size=6); 
}

module psutop_holes()
{
    for (i = [31 : 25.5 : b_w-20]){   
        translate([i+3.5,10.5,-5]) rotate([0,0,0]) cylinder(r=3.6/2,h=16,$fn=128);
        translate([i+3.5,92+7,-5]) rotate([0,0,0]) cylinder(r=3.6/2,h=16,$fn=128);
        } 

}

module psutop()
{
    difference(){
        psutop_body();
        psutop_holes();
        }
}

rotate([0,180,180]) psutop();