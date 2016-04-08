/* [Main] */

// select part
part = "assembly"; // [assembly:all parts assembled, beamFrame:beam frame, topNegXNegY_cornerBracket:top corner bracket (-x -y)]
// height and width of extrusion (mm)
beamHW = 10;
// linear rail outer diameter (mm)
linearRailOD = 8;
// linear bearing outer diamter (mm)
linearBearingOD = 15;
// plate thicknesses (mm) where not otherwise specified
plateThickness = 4;

/* [Frame] */

// frame beam length (mm)
frameBeamLength = 300;
frameSideLength = frameBeamLength + 2 * 0.5 * beamHW; // this accounts for two corner cubes (2 at half width)

/* [Rails] */

// Y axis linear rail to linear rail separation (center to center, mm)
yAxisRailSep = 30;

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

module yAxisRailMount() {
    yAxisRailMountBuffer = 10;
    yAxisRailMountWidth = linearBearingOD + (linearBearingOD - linearRailOD);
    yAxisRailMountHeight = yAxisRailSep + 
        (linearBearingOD * 2) + (.5 * linearBearingOD) + // to account for the required spacing of the bearings 
        yAxisRailMountBuffer;
    union() {
		difference() {
        	linear_extrude(height=plateThickness + beamHW)
            	polygon(points=[ [0, yAxisRailMountHeight * 1.1], [-yAxisRailMountWidth, yAxisRailMountHeight / 2], [-yAxisRailMountWidth, -yAxisRailMountHeight / 2], [0, -yAxisRailMountHeight / 2] ], convexity = 10);
			translate([-yAxisRailMountWidth/2, -yAxisRailSep/2, -cylHeightExt / 2]) cylinder(h=plateThickness + beamHW + cylHeightExt, d=linearRailOD);
			translate([-yAxisRailMountWidth/2, yAxisRailSep/2, -cylHeightExt / 2]) cylinder(h=plateThickness + beamHW + cylHeightExt, d=linearRailOD);
		}
        linear_extrude(height=plateThickness)
            polygon(points=[ [0, -yAxisRailMountHeight / 2], [ 1.5 * yAxisRailMountWidth, 0 ], [0, 0 ]], convexity=10);
    }
}

module beamBracket90() {
    cornerLength = 70.7 + 2 * beamHW; // 70.7 is a and b length of c = 10 (inner braces), 2*beam is an estimate of how far out the angle / beam sticks
   union() {
        linear_extrude(height=plateThickness)
            polygon(points=[ [0,0], [cornerLength, 0], [cornerLength, beamHW], [beamHW, cornerLength], [0, cornerLength] ], convexity = 10);
        linear_extrude(height=plateThickness + beamHW)
            polygon(points=[ [-plateThickness, -plateThickness ], [cornerLength, -plateThickness], [cornerLength, 0], [0, 0]], convexity = 10);
        linear_extrude(height=plateThickness + beamHW)           
            polygon(points=[ [-plateThickness, -plateThickness ], [-plateThickness,cornerLength], [0, cornerLength], [0, 0]], convexity = 10);
                }
}

module topNegXNegYCornerBracket() {
     fSLTrnas = frameSideLength / 2 + beamHW / 2; // Translation distant to put brack on the outside of frame
    color([.9, 0, 0]) {
    //translate([-fSLTrnas, -fSLTrnas, fSLTrnas]) 
        //translate([0, -plateThickness, 0])
            //rotate([-90, 0, 0]) 
                union() {
                    beamBracket90();
                    yAxisRailMount();
                }
    }
}