

include <microatxmini.scad>


module psu()
{
    cube([100,40.5,235]);

}

module backpanel_frame_base()
{
    difference(){
      cube([b_w+5,116.2+12-35.2-3.3,4]);
      translate([158.75+4, 116.2+9, -.1]) cube([81.28,3.3+1,5]);
    }
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
        translate([-4,0,0]) backpanel_holes();
        
    }
}

//rotate([0,0,0]) backpanel();
//backpanel_frame_base();
//psu();

module fanholes()
{
    
    for ( x = [1:5:35]){
        for (y=[1:5:35]){
            translate([x,y,-0.1]) cylinder(r=4/2,h=6,$fn=128);
            }
          }

}

module psu_back()
{
    difference(){
       translate([0,0,0])        cube([81.5,40.5,5]);
       translate([3.2,7,-0.1])     cube([24.2,31.6,6]);
       translate([3.2,4,-0.1])     cylinder(r=4/2,h=6);
       translate([81.5-5,4,-0.1])    cylinder(r=4/2, h=6);
       translate([81.5-6,36-1,-0.1])   cylinder(r=4/2,h=6);
       //translate([40,2.5,-0.1])   cube([40,35,6]);
       translate([35,4,0]) fanholes();
       }

}


psu_back();