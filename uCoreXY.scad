/* [Main] */

// select part
part = "assembly"; // [assembly:all parts assembled, beamFrame:beam frame, topNegXNegY_cornerBracket:top corner bracket (-x -y)]
// height and width of extrusion (mm)
beamHW = 10;
// linear rail diameter (mm)
linearRailD = 8;
// length of main arm
armLength = 100;
// length of forearm
forearmLength = 75;
// spacers: print sets or just one (need 6 arm spacers and 4 shoulder spacers)
print_spacer_sets = 1; //[1:true,0:false]

/* [Frame] */

// frame beam length (mm)
frameBeamLength = 300;

/* [Misc] */

// interference fit adjustment for 3D printer
iFitAdjust = .4;
iFitAdjust_d = .25;
// cylinder subtract height extension
cylHeightExt = .1;
// render quality
$fn = 24; // [24:low quality, 48:development, 64:production]

////////////////////// End header ////////////////////

use <makerBeam.scad>;

render_part();

module render_part() {
	if (part == "assembly") {
		assembly();
	} else if (part == "breamFrame") {
	} else if (part == "topNegXNegYCornerBracket") {
		topNegXNegY_cornerBracket();
	} else {
		// invalid value
	}
}

module assembly() {
    beamFrame();
}

module beamFrame() {
    frameSideLength = frameBeamLength + 2 * 0.5 * beamHW; // this accounts for two corner cubes (2 at half width)
    color([.6, .6, .6, .6]) {
        union() {
            translate([-frameSideLength / 2, -frameSideLength / 2, 0]) { makerBeam(frameBeamLength); }
            translate([-frameSideLength / 2, frameSideLength / 2, 0]) { makerBeam(frameBeamLength); }
            translate([frameSideLength / 2, -frameSideLength / 2, 0]) { makerBeam(frameBeamLength); }
            translate([frameSideLength / 2, frameSideLength / 2, 0]) { makerBeam(frameBeamLength); }
            translate([-frameSideLength / 2, 0, -frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([frameSideLength / 2, 0, -frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([0, -frameSideLength / 2, -frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            translate([0, frameSideLength / 2, -frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            translate([-frameSideLength / 2, 0, frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([frameSideLength / 2, 0, frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([0, -frameSideLength / 2, frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            translate([0, frameSideLength / 2, frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            for (i=[-1,1]) for (j=[-1,1]) for (k=[-1,1])
                translate([ i * frameSideLength / 2, j * frameSideLength / 2, k * frameSideLength / 2]) { cube([beamHW, beamHW, beamHW], center=true); }
        }
    }
}

module topNegXNegYCornerBracket() {

}
