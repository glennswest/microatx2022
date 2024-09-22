

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
            translate([x,y,-0.1]) cylinder(r=3.8/2,h=6,$fn=32);
            }
          }
}

module psu_holes()
{
  for (i = [11 : 25.5 : 100]){
        translate([i,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=32);
        translate([i,89.7-8.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=32);
        }
  for (i = [123+25.5 : 25.5 : 180]){
        translate([i,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=32);
        translate([i,89.7-8.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=32);
        }      
  for (i = [225 : 25.5 : 250]){
        translate([i,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=32);
        translate([i,89.7-8.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=32);
        }       

}



module frontpanel()
{
    difference(){
        frontpanel_frame_base();
        //translate([4.1,4.1+12,-.1]) cube([158.75,44.45,5]);
        translate([-4,0,0]) psu_holes(); 
        translate([10,15,0]) fanholes();
    }
   
   
  
}

rotate([90,0,0]) frontpanel();
