
/*
   Micro ATX
 */
b_w		= 243.84; /* x */
b_d		= 243.84; /* y */
b_h		= 45;     /* subjective height of the board - depends on fan/cards */
//b_hole_dia 	= 6.731;
b_hole_dia = 3.4;

b_holes = [ /* top->bottom, left->right */
	[  33.02,	237.49 ],
	[ 165.10,	237.49 ],
	[ 237.49,	237.49 ],
	[  10.16,	 80.01 ],
	[ 165.10,        80.01 ],
	[ 237.49,	 80.01 ],
	[  10.16,	 34.29 ],
	[ 165.10,	 34.29 ],
	[ 165.10,	 13.97 ],
    [ 237.49,    13.97 ]
];



module board() {
	%cube([b_w, b_d, b_h]);
}

module core_holes(theheight)
{
for (h = b_holes)
	{
		translate([h[0],h[1],0+2])
			cylinder( r=b_hole_dia/2, h = theheight, center=true, $fn=128 );
        translate([h[0],h[1],2])
			cylinder( r=6/2, h = 2, center=true, $fn=6 );    
	}

}

module frame_holes(theheight)
{
for (h = b_holes)
	{
		translate([h[0],h[1],0+2])
			cylinder( r=7/2, h = theheight, center=true, $fn=128 ); 
	}

}

module core_spacers(theheight)
{
for (h = b_holes)
	{
		translate([h[0],h[1],4.5])
			cylinder( r=b_hole_dia/2+1, h = theheight, center=true );

	}

}


module board_plate_base( spacer ) {
    cube([b_w, b_d, spacer]);
	//core_spacers(spacer);
     
}

module board_plate( spacer ) {
    difference(){
        board_plate_base(spacer);
        translate([0,0,-1]) core_holes(spacer+10);
        //base_holes();
        }
     
}



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

module board_frame_base()
{

      translate([20,0,0]) cube([b_w-20, 7, 7]);
      translate([0,27,0])  cube([7,b_d-34,7]);
      translate([0,b_d-7,0]) cube([b_w, 7, 7]);
      translate([b_w-7,0,0])  cube([7,b_d,7]);
      //translate([0,27,0]) cube([27,7,7]);
      //translate([20,0,0]) cube([7,27,7]);
      
}
module board_frame()
{
  difference(){
    board_frame_base();
    side_holes();
    translate([0,0,-1]) frame_holes(20);
    //top_holes();
    } 
}

module test_sizes()
{
     difference(){
      cube([7.5,30,7.5]);
      translate([3.75,15,-.1]) cylinder(r=3.4/2,h=9,$fn=128);
      translate([3.75,15,-.1]) cylinder(r=6/2,h=2,$fn=6);
      }
      

}

module standoff_core()
{
    difference(){
       cylinder(r=6/2,h=5,$fn=8);
       translate([0,0,-.1]) cylinder(r=3.4/2,h=5.2,$fn=200);
       }
}

module standoffs()
{
    translate([0, 0,0]) standoff_core();
    translate([0,10,0]) standoff_core();
    translate([0,20,0]) standoff_core();
    translate([0,30,0]) standoff_core();
    translate([0,40,0]) standoff_core();
    translate([10, 0,0]) standoff_core();
    translate([10,10,0]) standoff_core();
    translate([10,20,0]) standoff_core();
    translate([10,30,0]) standoff_core();
    translate([10,40,0]) standoff_core();

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
    translate([17.3-12,.3,3])   rotate([90,0,0]) cylinder(r=3.2/2,h=5,$fn=100);
   
}


//standoffs();

//backpanel();

//test_sizes();

//board_frame();
//board_plate(12);