include <microatxmini.scad>

plen = 89.7;

module psutop_body()
{
    translate([7,6.7,0]) cube([b_w-4,97,7]);
    translate([20,15,6.6]) rotate([0,0,90]) linear_extrude(.5) text( "psutop V100",size=6); 
}

module psutop_holes()
{
    for (i = [30 : 25.5 : b_w-20]){   
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