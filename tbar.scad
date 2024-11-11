include <microatxmini.scad>

plen = 89.7;

module tbar_body()
{
    translate([4,-112-30,0]) cube([7,plen+158,7]); 
    translate([b_w-4,-112-30,0]) cube([7,plen+158,7]);
    translate([7,0,0]) cube([b_w-4,14,7]);
    translate([7,92,0]) cube([b_w-4,14,7]);
    translate([7,-142,0]) cube([b_w-4,14,7]);
    translate([10,0,6.6]) rotate([0,0,90]) linear_extrude(.5) text( "tbar V100",size=6); 
}

module tbar_holes()
{
    for (i = [16.5 : 25.5 : 95]){
        translate([-1,i+3.5,3.5]) rotate([0,90,0]) cylinder(r=4.4/2,h=16,$fn=128);
        translate([b_w-8,i+3.5,3.5])  rotate([0,90,0]) cylinder(r=4.4/2,h=16,$fn=128);
        //translate([9,i+3.5,3.5]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        //translate([b_w-4.1,i+3.5,3.5]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        }    
    for (i = [-42.5+25.5 : -25.5 : -140]){
        translate([-1,i+3.5-1.5,3.5]) rotate([0,90,0]) cylinder(r=4.4/2,h=16,$fn=128);
        }   
     for (i = [-13-8 : -25.5 : -150]){
        translate([b_w-8,i+3.5,3.5])  rotate([0,90,0]) cylinder(r=4.4/2,h=16,$fn=128); 
        }       
    for (i = [30 : 25.5 : b_w-20]){   
        translate([i+3.5,3.5,-5]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
        translate([i+3.5,10.5,-5]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
        translate([i+3.5,92+7,-5]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
        translate([i+3.5,-142+7,-5]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
        } 
    translate([b_w-10,-142+8,-5]) rotate([0,0,0]) cylinder(r=4.4/2,h=20,$fn=128);    

}

module tbar()
{
    difference(){
        tbar_body();
        tbar_holes();
        }
}

rotate([0,180,180]) tbar();