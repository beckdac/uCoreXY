// Adapted from https://thingiverse-production-new.s3.amazonaws.com/assets/75/6e/cf/b4/45/makerBeam.scad
$fn=50;

module makerBeam(length)
{
	difference(){
		union(){
			// body
			cube([4,4,length], center=true);
			// corners
			for (i=[0:3]){
				rotate([0, 0, i*90]){corner(length);}
			}
		}
		// center hole
		cylinder(h=length, r=1.5, center=true);
	};
}

module corner(length){
	difference(){
		union(){
			// arm
			rotate([0, 0, 45]){
				translate([0,2.5,0]){cube([.7, 7.5, length], center=true);}
			}

			translate([-4.5, 3.5, 0]){cube([1, 3, length], center=true);}
			translate([-3.5, 4.5, 0]){cube([3, 1, length], center=true);}
			translate([-3.5, 3.5, 0]){cube([1.5, 1.5, length], center=true);}
		}

		translate([-2, 5, 0]){cylinder(h=length, r=0.25, center=true);}
		translate([-5, 2, 0]){cylinder(h=length, r=0.25, center=true);}

		// round external shape
		difference(){
			translate([-4.75, 4.75, 0]){cube([.5, .5, length], center=true);}
			translate([-4.5, 4.5, 0]){cylinder(h=length, r=.5, center=true);}
		}
	}
}


makerBeam(50);
