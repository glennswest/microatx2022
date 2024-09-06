

include <microatxmini.scad>


module trackmount()
{
    translate([0,16,8]) cube([89.7,5.11,11]);
    translate([0,16,8+11]) cube([89.7,15,4]);
   
    translate([0,16+74+1,8]) cube([89.7,5.11,11]);
    translate([0,16+74+1,8+11]) cube([89.7,15,4]);
}
    
module frontpanel_frame_base()
{
    
      cube([b_w+5,89.7,4]);
      translate([215,89.7,8]) rotate([0,180,90]) trackmount();  
    
    
}

module fanholes()
{
    
    for ( x = [1:5:95]){
        for (y=[1:5:65]){
            translate([x,y,-0.1]) cylinder(r=3.8/2,h=6,$fn=64);
            }
          }
}


module frontpanel_holes()
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
module frontpanel()
{
    difference(){
        frontpanel_frame_base();
        //translate([4.1,4.1+12,-.1]) cube([158.75,44.45,5]);
        translate([-4,0,0]) frontpanel_holes();
        translate([7+4,89.7-7+2,-1]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([b_w-7+4,89.7-7+2,-1]) cylinder(r=3.4/2,h=16,$fn=128);   
        translate([10,15,0]) fanholes();
    }
   
   
  
}

rotate([90,0,0]) frontpanel();
