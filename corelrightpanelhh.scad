

include <microatxmini.scad>


plen = 89.7;

module rightpanel_frame_body()
{
    translate([0,0,-2]) cube([b_w+7+2+12+6,plen,6]);
    translate([0,0,4]) cube([b_w+7+2+12-2,6,6]);
    translate([4,13.5,4]) cube([12,plen-24-6,9]); 
    translate([b_w+7+2+12-9+6,6,4]) cube([9.2,plen-10,12]); 
    translate([b_w+7+2+12-9+6+7,0,0]) cube([2.2,12,16]); 
      translate([100,20,4]) rotate([0,0,0]) linear_extrude(.5) text( "corerightpanelhh V100",size=8); 
}
module rightpanel_frame_base()
{
    difference(){
      rightpanel_frame_body();
      translate([b_w+7+2+12-9+7.5-2.4,5,4]) cube([8.1,6-2,15]);
      translate([b_w+7+2+12-9+7.5,-1,10]) cube([6.1,plen+3,15]); 
     
      
    }
   
    
    
}

// PSU top is 40.5mm
// Bar is 6mm - top of bar is 46.5 - midpoint is 43.5
module rightpanel_holes()
{  
   for (i = [17+25.5: 25.5 : 250]){
        translate([i,3.5,-3]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        translate([i,43.5,-3]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        translate([i,89.7-7,-3]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        
        
        }  
   for (i = [15-2.5+1.5 : 25.5 : 89]){
        translate([5,i+3.5,10]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([18,i+3.5,10]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        }    
        

}
// Slot = 12.7mm
// Half Slot = 6.35
// 12.7 - 6.35 = 
// Slot Spacing = 20.32
module rightpanel()
{
    difference(){
        rightpanel_frame_base();
        translate([-4,0,0]) rightpanel_holes();
             // Cut for test print
        translate([-80,-1,-4]) cube([b_w+7+2+12+6+20,plen+20,50]);
        }
}

rotate([0,0,0]) rightpanel();
