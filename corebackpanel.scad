

include <microatxmini.scad>


module backpanel_holder()
{
    difference(){
       rotate([90,0,0]) translate([0,-3.4,0]) cube([81.28+5,18,3.3]);
       translate([0,0,0]) slot_hole();
       translate([20.32,0,0]) slot_hole();
       translate([20.32*2,0,0]) slot_hole();
       translate([20.32*3,0,0]) slot_hole();
       translate([0,0,-.1]) cube([81.28,16,4]);
       
       }
}

module backpanel_frame_base()
{
    difference(){
      cube([b_w+5,116.2+12,4]);
      translate([158.75+4, 116.2+9, -.1]) cube([81.28,3.3+1,5]);
    }
    translate([158.75+4.1, 116.2+12, 3.4]) backpanel_holder();
}


module backpanel_holes()
{
       //translate([5,    3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);  
       translate([30.5, 3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);        
       translate([56.0, 3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([81.5, 3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([107,  3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([132.5,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([158.0,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([183.5,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([209.5,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([235,  3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);     

}
// Slot = 12.7mm
// Half Slot = 6.35
// 12.7 - 6.35 = 
// Slot Spacing = 20.32
module backpanel()
{
    difference(){
        backpanel_frame_base();
        translate([4.1,4.1+12,-.1]) cube([158.75,44.45,5]);
        translate([4.1+158.75+6.35,4.1+12,-.1])       cube([12.7,100.9,5]);
        translate([4.1+158.75+6.35+20.32,4.1+12,-.1]) cube([12.7,100.9,5]);
        translate([4.1+158.75+6.35+40.64,4.1+12,-.1]) cube([12.7,100.9,5]);
        translate([4.1+158.75+6.35+60.96,4.1+12,-.1]) cube([12.7,100.9,5]);
        translate([-4,0,0]) backpanel_holes();
        
    }
}

rotate([0,0,0]) backpanel();
