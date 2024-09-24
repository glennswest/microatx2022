

include <microatxmini.scad>


plen = 89.7;

module leftpanel_frame_base()
{
    difference(){
      cube([b_w+7+2,plen,4]);
      translate([158.75+4, 116.2+9, -.1]) cube([81.28,3.3+1,5]);
    }
    translate([4,13.5,4]) cube([7,plen-24-7,6]); 
    translate([b_w-4,13.5,4]) cube([7,plen-24-7,9]); 
}

// PSU top is 40.5mm
// Bar is 6mm - top of bar is 46.5 - midpoint is 43.5
module leftpanel_holes()
{  
   for (i = [30.5 : 25.5 : 235]){
        translate([i,3.5,-1]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        translate([i,43.5,-1]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        translate([i,89.7-7,-1]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        
        
        }  
   for (i = [15-2.5+1.5 : 25.5 : 89]){
        translate([-1,i+3.5,10-3.2]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([b_w-8,i+3.5,10])  rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([12.8,i+3.5,10-3.2]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        translate([b_w-.1,i+3.5,10]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        }     

}
// Slot = 12.7mm
// Half Slot = 6.35
// 12.7 - 6.35 = 
// Slot Spacing = 20.32
module leftpanel()
{
    difference(){
        leftpanel_frame_base();
        translate([-4,0,0]) leftpanel_holes();
        translate([100,20,3.80]) rotate([0,0,180]) linear_extrude(.5) text( "coreleftpanelhh V400",size=4);
        
    }
}

rotate([0,0,0]) leftpanel();
