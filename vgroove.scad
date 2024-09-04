

module male_part()
{
  
     cube([100, 7, 7]);
     rotate([90,0,0]) translate([0,3.5,1]) rotate([0,90,0]) cylinder(r=5/2,h=100,$fn=3);
     
}     
     
module female_part()
{
  difference(){
      cube([100, 7, 7]);
      rotate([180,0,0]) translate([0,0,-7]) scale([1.01,1.01,1.01]) male_part();
     }
}          
     
translate([0,0,0]) female_part();
translate([0,20,0]) male_part();
 