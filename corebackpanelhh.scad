

include <microatxmini.scad>


module rail_holes()
{
  for (i = [25.5 : 25.5 : 160]){
        translate([-1,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        }

}

module slot_hole()
{
    translate([17.3-4,9.3-9,14]) rotate([90,0,0]) cylinder(r=9.3/2,h=5,$fn=100);
    translate([17.3-4,9.3-9,12]) rotate([90,0,0]) cylinder(r=9.3/2,h=5,$fn=100);
    translate([17.3-4,9.3-9,10]) rotate([90,0,0]) cylinder(r=9.3/2,h=5,$fn=100);
    translate([17.3-4,9.3-9,8]) rotate([90,0,0]) cylinder(r=9.3/2,h=5,$fn=100);
    translate([17.3-4,9.3-9,6]) rotate([90,0,0]) cylinder(r=9.3/2,h=5,$fn=100);
    //translate([17.3-4,9.3-9,4]) rotate([90,0,0]) cylinder(r=9.3/2,h=5,$fn=100);
    //translate([17.3-4,9.3-9,2]) rotate([90,0,0]) cylinder(r=9.3/2,h=5,$fn=100);
    translate([17.3-12,.3,2.5])   rotate([90,0,0]) cylinder(r=3.2/2,h=5,$fn=100);
   
}

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
      cube([b_w+5,89.7,4]);
      translate([158.75+4, 116.2+9, -.1]) cube([81.28,3.3+1,5]);
    }
    translate([158.75+4.1, 116.2+12-35.2-3.3, 3.4]) backpanel_holder();
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

module upper_rail()
{
    difference(){
       cube([168,7,7]);
       for (i = [18 : 25.5 : 168]){
        translate([i,15,3.5]) rotate([90,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
        }
    }
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
        translate([4.1+158.75+6.35,4.1+12,-.1])       cube([12.7,100.9-33,5]);
        translate([4.1+158.75+6.35+20.32,4.1+12,-.1]) cube([12.7,100.9-33,5]);
        translate([4.1+158.75+6.35+40.64,4.1+12,-.1]) cube([12.7,100.9-33,5]);
        translate([4.1+158.75+6.35+60.96,4.1+12,-.1]) cube([12.7,100.9-33,5]);
        translate([-4,0,0]) backpanel_holes();
        translate([0,89.7-5,7]) rotate([0,90,-90]) rail_holes();
       
        
    }
    //%translate([0,89.7-12,-7]) cube([168,7,7]);
}

rotate([0,0,0]) backpanel();

