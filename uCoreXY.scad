/* [Main] */

// select part
part = "assembly"; // [assembly:all parts assembled, beamFrame:beam frame, topNegXNegY_cornerBracket:top corner bracket (-x -y)]
// height and width of extrusion (mm)
beamHW = 10;
// linear rail diameter (mm)
linearRailOD = 8;
// plate thicknesses (mm) where not otherwise specified
plateThickness = 4;

/* [Frame] */

// frame beam length (mm)
frameBeamLength = 300;
frameSideLength = frameBeamLength + 2 * 0.5 * beamHW; // this accounts for two corner cubes (2 at half width)

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
    union() {
        beamFrame();
        topNegXNegYCornerBracket();
    }
}

module beamFrame() {
    color([.6, .6, .6, .6]) 
        union() {
            for (i=[-1, 1]) for (j=[-1,1])
                translate([i * frameSideLength / 2, j * frameSideLength / 2, 0]) makerBeam(frameBeamLength);            
            translate([-frameSideLength / 2, 0, -frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([frameSideLength / 2, 0, -frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([0, -frameSideLength / 2, -frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            translate([0, frameSideLength / 2, -frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            translate([-frameSideLength / 2, 0, frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([frameSideLength / 2, 0, frameSideLength / 2]) { rotate([90, 0, 0]) { makerBeam(frameBeamLength); } }
            translate([0, -frameSideLength / 2, frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            translate([0, frameSideLength / 2, frameSideLength / 2]) { rotate([0, 90, 0]) { makerBeam(frameBeamLength); } }
            for (i=[-1,1]) for (j=[-1,1]) for (k=[-1,1])
                translate([ i * frameSideLength / 2, j * frameSideLength / 2, k * frameSideLength / 2]) cube([beamHW, beamHW, beamHW], center=true);
        }
    
}

module topNegXNegYCornerBracket() {
    cornerLength = 70.7 + 2 * beamHW; // 70.7 is a and b length of c = 10 (inner braces), 2*beam is an estimate of how far out the angle / beam sticks
    color([.9, 0, 0]) {
    fSLTrnas = frameSideLength / 2 + beamHW / 2; // Translation distant to put brack on the outside of frame
    translate([-fSLTrnas, -fSLTrnas, fSLTrnas]) {
        translate([0, -plateThickness, 0]){
            rotate([-90, 0, 0]) {
                union() {
                    linear_extrude(height=plateThickness) { polygon(points=[ [-plateThickness,-plateThickness], [cornerLength, -plateThickness], [cornerLength, beamHW], [beamHW, cornerLength], [-plateThickness, cornerLength] ], convexity = 10); }
                }
            }
        }
    } }
}
