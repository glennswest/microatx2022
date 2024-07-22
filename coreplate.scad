

use <microatxmini.scad>

module coreplate(){
    board_plate(5);
    translate([0,0,-7]) board_frame();
}

rotate([180,0,0]) coreplate();
