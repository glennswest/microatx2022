

include <microatxmini.scad>

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

module side_holes()
{
    for (i = [18 : 25.5 : 230]){
        translate([-1,i,3.5]) rotate([0,90,0]) cylinder(r=4.4/2,h=16,$fn=128);
        translate([-1+b_w-8,i,3.5]) rotate([0,90,0]) cylinder(r=4.4/2,h=16,$fn=128);
        
        translate([i,-1,3.5]) rotate([-90,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
        translate([i,-1+b_d-8,3.5]) rotate([-90,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
        }
}

module top_holes()
{
   for (i = [18+12.5 : 25.5 : 230]){     
       translate([3.5,i,-1]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
       translate([3.5+b_w-7.25,i,-1]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
      
       translate([i,3.5,-1]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
       translate([i,239.34+.5,-1]) rotate([0,0,0]) cylinder(r=4.4/2,h=16,$fn=128);
     
     }
}

module core_holes(theheight)
{
for (h = b_holes)
	{
		translate([h[0],h[1],0+2])
			cylinder( r=4.2/2, h = theheight, center=true, $fn=128 );
	}

}

module board_plate_base( spacer ) {
    cube([b_w, b_d, spacer]);
     
}

module board_plate( spacer ) {
    difference(){
        board_plate_base(spacer);
        translate([1.5,0,7]) core_holes(spacer);
        }
     
}



module coreplate(){
    difference(){
       translate([0,0,-7]) board_plate(5+7);
       translate([-0.1,0,0]) cube([4.1,100,5]); // Expansion card tongue 
       translate([0,0,-7]) side_holes(); 
       }
    translate([20,220,14]) rotate([0,0,-90]) linear_extrude(.5) text( "Motherboard Backplate -  Version 80",size=6);   
}

rotate([180,0,0]) coreplate();
