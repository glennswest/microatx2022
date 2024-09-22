

include <microatxmini.scad>

// Switch
// https://www.aliexpress.com/item/3256803436981644.html?pdp_ext_f=%7B%22sku_id%22%3A%2212000026547329693%22%7D&gatewayAdapt=4itemAdapt

module psu()
{
    cube([170,82.3,42]);

}

module backpanel_frame_base()
{
    difference(){
      cube([b_w+5,116.2+12-35.2-3.3,4]);
      translate([158.75+4, 116.2+9, -.1]) cube([81.28,3.3+1,5]);
    }
}

module rail_holes()
{
  for (i = [25.5 : 25.5 : 160]){
        translate([-1,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        }

}





module fanholes()
{
    
    for ( x = [1:5:35]){
        for (y=[1:5:35]){
            translate([x,y,-0.1]) cylinder(r=3.8/2,h=6,$fn=64);
            }
          }

}
module psu_holes()
{
       translate([3.2,7,-0.1])     cube([24.2,31.6,6]);
       translate([4,4,-0.1])     cylinder(r=4.1/2,h=6,$fn=64);
       translate([81.5-6,4-.3,-0.1])    cylinder(r=4.1/2, h=6,$fn=64);
       translate([81.5-6,36-.9,-0.1])   cylinder(r=4.1/2,h=6,$fn=64);
       //translate([40,2.5,-0.1])   cube([40,35,6]);
       translate([35,4,0]) fanholes();
       translate([20,6,3.80]) rotate([0,0,180]) linear_extrude(.5) text( "v118",size=4);
}

module psu_back()
{
    difference(){
       translate([0,0,0])        cube([81.5,40.5,5]);
       psu_holes();
       }

}

module side_holes()
{
    for (i = [15 : 25.5 : 102.3]){
        translate([0,i,-1]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        translate([89.7-7-3.5,i,-1]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        }
    for (i = [15 : 25.5 : 89]){
        translate([i,6,-1]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        //translate([i,102.3-6,-1]) rotate([0,0,0]) cylinder(r=4.1/2,h=16,$fn=128);
        }
}

module psu_halfheight()
{
    difference(){
      translate([0,1,0])cube([89.7,102.3-3-1,4]);
      translate([48+2.5+1.685,10,0]) rotate([180,180,-90]) psu_holes();
      translate([3.5,-2,0]) side_holes(); 
      translate([65,24,-1]) rotate([0,0,0]) cylinder(r=16.5/2,h=16,$fn=128);  
      // Here for top frame
      %rail_holes();
      }

}
//%psu_back();
psu_halfheight();
//rotate([0,0,0]) backpanel();
//backpanel_frame_base();
//%psu();


