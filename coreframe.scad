
module frame_base()
{
    translate([0,0,0]) cube([220,7,7]); 
    translate([0,0,0]) cube([7,243.84-7,7]);
    translate([0,243.84-7,0]) cube([220,7,7]);
    translate([220-7,7,0]) cube([7,243.84-14,7]);
  
    
    for (i = [25.5 : 50.1 : 220]){
         translate([7,i,7]) rotate([0,90,0]) cube([7,12,7]);
         translate([220-13,i,7]) rotate([0,90,0]) cube([7,12,7]);
         translate([i,7,7]) rotate([-90,0,0]) cube([12,7,7]);
         translate([i,243.84-7,7]) rotate([-90,0,0]) cube([12,7,7]);
         }
}

module frame_holes()
{
    for (i = [18.5-3 : 25.5 : 240]){
         translate([-1,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=20,$fn=128);
         translate([7-2.6,i,3.5]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.7,$fn=6);
      
         translate([220-7.1,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=20,$fn=128);
         translate([220-9.6,i,3.5]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.7,$fn=6);
         
         translate([i,-1,3.5]) rotate([-90,0,0]) cylinder(r=3.4/2,h=20,$fn=128);
         translate([i,7-2.6,3.5]) rotate([-90,0,0]) cylinder(r=6.8/2,h=2.7,$fn=6);
      
         translate([i,243.84-7.1,3.5]) rotate([-90,0,0]) cylinder(r=3.4/2,h=20,$fn=128);
         translate([i,243.84-7.1,3.5]) rotate([-90,0,0]) cylinder(r=6.8/2,h=2.7,$fn=6);
         }
    for (i = [25.5 : 50.1 : 220]){
         translate([7,i+6,0.8]) rotate([0,0,0]) cylinder(r=10/2,h=3.4,$fn=128);
         translate([220-7,i+6,0.8]) rotate([0,0,0]) cylinder(r=10/2,h=3.4,$fn=128);
         translate([i+6,7,0.8]) rotate([0,0,0]) cylinder(r=10/2,h=3.4,$fn=128);
         translate([i+6.2,243.84-1,0.8]) rotate([0,0,0]) cylinder(r=10/2,h=3.4,$fn=128);
         }     
       
}

module frame()
{
    difference(){
        frame_base();
        frame_holes();
        }


}



frame();