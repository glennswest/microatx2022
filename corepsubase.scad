





module psu()
{
    cube([170,82.3,42]);

}

module psu_frame_base()
{
    
      translate([0,0,7])cube([243.84,102.3,4]);
      translate([0,0,0]) cube([243.84, 7, 7]);
      translate([0,7,0])  cube([7,102.3-7,7]);
      translate([7,102.3-7,0]) cube([243.84-14, 7, 7]);
      translate([243.84-7,0,0])  cube([7,102.3,7]); 
      //%translate([0,10,11]) psu();
    
}



module side_holes()
{
    for (i = [15 : 25.5 : 102.3]){
        translate([-1,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([4.9,i,3.5]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        translate([-1+243.84-8,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([6.9+243.84-14,i,3.5]) rotate([0,90,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        }
        
    for (i = [18 : 25.5 : 230]){
        translate([i,-1,3.5]) rotate([-90,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([i,4.9,3.5]) rotate([-90,0,0]) cylinder(r=6.8/2,h=2.5,$fn=6);
        translate([i,-1+102.3-8,3.5]) rotate([-90,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([i,6.9+102.3-14,3.5]) rotate([-90,0,0]) cylinder(r=6.8/2,h=2.5,$fn=6);  
        }
        
}

module psu_base()
{
    difference(){
        psu_frame_base();
        side_holes();
        translate([15,15,7.3]) rotate([180,0,0]) linear_extrude(.4) text( "V2",size=4);
        }
}



psu_base();


