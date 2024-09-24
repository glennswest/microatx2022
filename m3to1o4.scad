

module cap_body()
{
   cylinder(r=7.8/2,h=2,$fn=64);
}

module cap()
{
difference(){
  cap_body();
  translate([0,0,-1]) cylinder(r=3.4/2,h=5,$fn=64);
  }
}


cap();