
$fn = 9;
fn_corner = 50;

/*
   Rack
 */
r_unit 		= 44.45;
r_unit_nb	= 6;
r_spacer	= 4*2;	/* 2*4 mm spacer (up/down) */
r_d		= r_unit * r_unit_nb;
r_w		= 440;  /* Rack tray internal width */
r_depth		= 300;	/* Rack tray depth if it has a blocker */

/*
   Micro ATX
 */
b_w		= 243.84; /* x */
b_d		= 243.84; /* y */
b_h		= 45;     /* subjective height of the board - depends on fan/cards */
b_hole_dia 	= 2.5;

/*
   Flex PSU
 */
f_w		= 200;	  /* x */
f_d		= 81.5;	  /* y */
f_h		= 40.5;	  /* z */

/*
   Disk 2.5 3.5
   */
d_w1		= 200;	  /* x */
d_d1		= 101.6;  /* y */
d_w2		= 100;	  /* x */
d_d2		= 69.85;  /* y */

/*
   Plate
 */
p_d		= r_d - r_spacer;
p_front_b_decal	= 5;	/* 5 mm */
p_w		= p_front_b_decal + b_w + f_w + 50;	/* 5cm */
p_w_mb  = p_front_b_decal + b_w + 50;	/* 5cm */
p_thickness	= 1;
p_slot_w	= r_depth;
p_slot_d	= 10;
p_holder_w	= 20;
p_holder_d	= 100;
p_f_nb		= 5;  /* flex hole number */
p_d_nb		= 5;  /* disk hole number */
p_itemhole_w	= 10; /* flex/disk hole w */
p_itemhole_d	= 4;  /* flex/disk hole d */

/*
   Support
 */
s_h		= 7;	/* total 8mm */
s_thickness	= 1;	/* 2mm base thickness */
s_w		= r_depth/3;
s_d		= r_w / 3;


b_holes = [ /* top->bottom, left->right */
	[  33.02,	237.49 ],
	[ 165.10,	237.49 ],
	[ 237.49,	237.49 ],
	[  10.16,	 80.01 ],
	[ 165.10,        80.01 ],
	[ 237.49,	 80.01 ],
	[  10.16,	 34.29 ],
	[ 165.10,	 34.29 ],
	[ 165.10,	 13.97 ]
];

module board() {
	cube([b_w, b_d, b_h]);
}

module board_mask( spacer ) {
	board();
	for (h = b_holes)
	{
		translate([h[0],h[1],0])
			cylinder( r=b_hole_dia/2, h = spacer, center=true );
	}
}

module slot_mask(w, nb) {
	for (i = [0 : nb-1])
		translate([ w/(nb*2) + (w*i)/nb - p_itemhole_w/2, p_itemhole_d/-2,-p_thickness])
			cube([ p_itemhole_w, p_itemhole_d, p_thickness * 3 ]);
}
module psu_slots_mask() {
	slot_mask(f_w, p_f_nb);
	translate([0,f_d,0])
		slot_mask(f_w, p_f_nb);
}
module disk_slots_mask() {
	slot_mask(d_w1, p_d_nb);
	translate([0,d_d1,0])
		slot_mask(d_w1, p_d_nb);
	translate([0,d_d2,0])
		slot_mask(d_w1, p_d_nb);
}

module plate() {
	difference() {
		translate([ + p_front_b_decal, (p_d - b_d) / 2, 0 ])
		{
			difference()
			{
//				minkowski()
				{
					translate([ - p_front_b_decal, (p_d - b_d) / -2, 0 ]) {
						difference() {
							difference() {
								union() {
									cube([ p_w , p_d, p_thickness ]);
									translate([ -p_holder_w, 0, 0 ]) {
										cube([ p_holder_w, p_holder_d, p_thickness ]);
									}
								}
								translate([ -p_holder_w/3, p_holder_d/3, -p_thickness/2])
									cube([ p_holder_w*2/3, p_holder_d*1/2, p_thickness*2 ]);
								translate([ -p_itemhole_w, p_holder_d - p_itemhole_d*2, -p_thickness/2])
									cube([ p_itemhole_w, p_itemhole_d, p_thickness*2 ]);
							}
							/* Slots */
							translate([p_slot_w, 0, -p_thickness])
								cube([ p_slot_w, p_slot_d, p_thickness*3 ]);
							translate([p_slot_w, p_d - p_slot_d, -p_thickness])
								cube([ p_slot_w, p_slot_d, p_thickness*3 ]);
						}
					}
//					cylinder( r=0.1, h=0.0000001 );
				}
				translate([ 0, 0, p_thickness+0.001 ]) board_mask(p_thickness*4);
			}
		}
		/* PSU slots */
		translate( [p_w - f_w, p_d - p_slot_d - f_d - 20] )
			psu_slots_mask();
		/* Disk slots */
		translate( [p_w - d_w1, p_slot_d + 20] )
			disk_slots_mask();
	}
}

module platemb() {
	difference() {
		translate([ + p_front_b_decal, (p_d - b_d) / 2, 0 ])
		{
			difference()
			{
//				minkowski()
				{
					translate([ - p_front_b_decal, (p_d - b_d) / -2, 0 ]) {
						difference() {
							difference() {
								union() {
									cube([ p_w_mb , p_d, p_thickness ]);
									translate([ -p_holder_w, 0, 0 ]) {
										cube([ p_holder_w, p_holder_d, p_thickness ]);
									}
								}
								translate([ -p_holder_w/3, p_holder_d/3, -p_thickness/2])
									cube([ p_holder_w*2/3, p_holder_d*1/2, p_thickness*2 ]);
								translate([ -p_itemhole_w, p_holder_d - p_itemhole_d*2, -p_thickness/2])
									cube([ p_itemhole_w, p_itemhole_d, p_thickness*2 ]);
							}
						}
					}
//					cylinder( r=0.1, h=0.0000001 );
				}
				translate([ 0, 0, p_thickness+0.001 ]) board_mask(p_thickness*4);
			}
		}
	}
}



module round(o) {
	r = 5;
	rotate([0,0,o])
	translate([r,r,0]) {
		difference() {
			cube([r*2,r*2,p_thickness*4],center=true);
			cylinder(r=r, h=p_thickness*10, center=true, $fn=fn_corner);
			translate([0,-r*4,-p_thickness*4]) cube([r*8,r*8,p_thickness*8]);
			translate([-r*4,0,-p_thickness*4]) cube([r*8,r*8,p_thickness*8]);
		}
	}
}
module round_mask() {
	translate([-p_holder_w,0,0]) round(0);	/* bottom left */
	translate([-p_holder_w,p_holder_d,0]) round(-90);	/* bottom left */
	translate([0,p_d,0]) round(-90);	/* top left */
	translate([p_slot_w,p_d,0]) round(180);	/* top slot */
	translate([p_w,p_d-p_slot_d,0]) round(180);	/* top right */
	translate([p_slot_w,0,0]) round(90);	/* bottom slot */
	translate([p_w,p_slot_d,0]) round(90);	/* bottom right */
}

module plate_round() {
	difference(){ 
		plate();
		round_mask();
	}
}

module plate_roundmb() {
	difference(){ 
		platemb();
		round_mask();
	}
}

module support() {
	difference() {
		//cube([ s_w, s_d, s_h ]);
		cube([ 10, s_d, s_h ]);
		translate([10,-1,s_thickness+1])
			cube([ s_w+2, s_d+2, s_h ]);
		/* Slots - every 1mm */
		for (i = [0:100]) {
			translate([-1, 1 + (p_thickness*2.5+p_thickness)*i, s_thickness])
				cube([s_w+2, p_thickness+0.8, s_h]);
		}
		for (i = [0:20]) {
			translate([20+i*1.6*20,-1,0.15]) {
				translate([0,0,7.5])
					scale([1,1,0.4])
					rotate([-90,0,0])
					cylinder(r=21.3, h=s_d+100, $fn=6);
			}
		}
	}
}





/*
   Rack Simulation
 */
plate_nb		= 7;
plate_board_spacer	= 6;
module one_plate() {
	rotate([-90,0,0]) translate([0,-p_d,0]) {
		union() {
			translate([ p_front_b_decal, (p_d - b_d) / 2, p_thickness+plate_board_spacer ])
				color([0,0,1])
				board_mask( plate_board_spacer*2 );
			plate();
		}
	}
}
module all_plate() {
	for (i = [0:plate_nb-1])
		translate([0, (i*r_w)/(plate_nb),0])
			one_plate();
}
module shelf() {
	cube([ 60, r_w, 1 ]);
	translate([0,0,r_d])
		cube([ 60, r_w, 1 ]);
	translate([0,0,r_spacer/2 +1])
		all_plate();
}

//all_plate();
//shelf();
/* For 2d projection - dxf export */
//projection(cut = false) plate_round();

//plate_round();

plate_roundmb();

//support();


