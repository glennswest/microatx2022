use <corepsubase.scad>;
use <coreleftpanelhh.scad>;
include <microatxmini.scad>

psu_base();
translate([-4,-4,89.7-4]) rotate([90,180,-180]) leftpanel();