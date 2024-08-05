

b_w		= 243.84; /* x */
b_d		= 243.84; /* y */
b_h		= 45;     /* subjective height of the board - depends on fan/cards */
//b_hole_dia 	= 6.731;
b_hole_dia = 3.4;






module side_holes()
{
    for (i = [18 : 25.5 : 230]){
        translate([-1,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([5.9,i,3.5]) rotate([0,90,0]) cylinder(r=6/2,h=2,$fn=6);
        translate([-1+b_w-8,i,3.5]) rotate([0,90,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([5.9+b_w-14,i,3.5]) rotate([0,90,0]) cylinder(r=6/2,h=2,$fn=6);
        
        translate([i,-1,3.5]) rotate([-90,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([i,5.9,3.5]) rotate([-90,0,0]) cylinder(r=6/2,h=2,$fn=6);
        translate([i,-1+b_d-8,3.5]) rotate([-90,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
        translate([i,5.9+b_d-14,3.5]) rotate([-90,0,0]) cylinder(r=6/2,h=2,$fn=6);  
        }
}

module top_holes()
{
   for (i = [18+12.5 : 25.5 : 230]){     
       translate([3.5,i,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5,i,-0.1]) rotate([0,0,0]) cylinder(r=6/2,h=2,$fn=6);
       translate([3.5+b_w-7.25,i,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5+b_w-7.25,i,-0.1]) rotate([0,0,45])  cylinder(r=6/2,h=2,$fn=6);
        
       translate([i,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([i,3.5,-0.1]) rotate([0,0,0]) cylinder(r=6/2,h=2,$fn=6);
       translate([i,239.34+.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([i,239.34+.5,-0.1]) rotate([0,0,0]) cylinder(r=6/2,h=2,$fn=6);
     
     }
}

module base_holes()
{
      
       translate([3.5,56.0,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5,107,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([3.5,132.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([3.5,158.0,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5,183.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5,209.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);        
     
       translate([3.5+b_w-7.25,30.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);  
       translate([3.5+b_w-7.25,56.0,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5+b_w-7.25,107,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([3.5+b_w-7.25,132.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([3.5+b_w-7.25,158.0,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5+b_w-7.25,183.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([3.5+b_w-7.25,209.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);    
     
       translate([30.5, 3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);  
       translate([56.0, 3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([81.5, 3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([107,  3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([132.5,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([158.0,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([183.5,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([209.5,3.5,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
 
       translate([56.0, b_w-7.25,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([81.5, b_w-7.25,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([107,  b_w-7.25,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([132.5,b_w-7.25,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128); 
       translate([183.5,b_w-7.25,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);
       translate([209.5,b_w-7.25,-1]) rotate([0,0,0]) cylinder(r=3.4/2,h=16,$fn=128);       
     
}



module psu_frame_base()
{

      translate([20,0,0]) cube([b_w-20, 7, 7]);
      translate([0,27,0])  cube([7,b_d-34,7]);
      translate([0,b_d-7,0]) cube([b_w, 7, 7]);
      translate([b_w-7,0,0])  cube([7,b_d,7]);
      //translate([0,27,0]) cube([27,7,7]);
      //translate([20,0,0]) cube([7,27,7]);
      
}
module psu_frame()
{
  difference(){
    psu_frame_base();
    side_holes();
    //top_holes();
    } 
}



module psu_plate_base( spacer ) {
    cube([b_w, b_d, spacer]);
	//core_spacers(spacer);
     
}

module psu_plate( spacer ) {
    difference(){
        psu_plate_base(spacer);
        //base_holes();
        }
     
}



module corepsu(){
    psu_plate(5);
    translate([0,0,-7]) psu_frame();
}

rotate([180,0,0]) corepsu();
