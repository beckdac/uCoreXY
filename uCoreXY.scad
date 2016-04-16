// Requires OpenSCAD 2016.3+

/* [Main] */

// select part
part = "assembly";
//part = "yCarriage";
//part = "topNegXNegYCornerBracket";
// [assembly:all parts assembled, beamFrame:beam frame, topNegXNegYCornerBracket:top corner bracket (-x -y), topPosXNegYCornerBracket:top corner bracket (x -y), topNegXPosYCornerBracket:top corner bracket (-x y), topPosXPosYCornerBracket (x y), yAxisLinearRails:y axis linear rails, xAxisLinearRails:x axis linear rails, yCarriage:y axis carriage]
// height and width of extrusion (mm)
beamHW = 10;
// plate thicknesses (mm) where not otherwise specified
plateThickness = 4;
// reinforced plate thickness scale applied to normal plate thickness where more strength required
reinforcedPlateScale = 1.2;

/* [Frame] */

// frame beam length (mm)
frameBeamLength = 300;
frameSideLength = frameBeamLength + 2 * 0.5 * beamHW; // this accounts for two corner cubes (2 at half width)

/* [Rails] */

// linear rail outer diameter (mm)
linearRailOD = 8;
// Y axis linear rail to linear rail separation (center to center, mm)
yAxisRailSep = 30;
// Y axis linear rail mount tighenting screw diameter (mm)
yAxisRailTightScrewD = 3;
yAxisRailTightScrewDepth = 12;
yAxisRailTightCaptiveNutWidth = 5.5; // takend from http://www.fairburyfastener.com/xdims_metric_nuts.htm
yAxisRailTightCaptiveNutHeight = 2.4; // takend from http://www.fairburyfastener.com/xdims_metric_nuts.htm
// clearence between y axis linear bearings and bracket (mm)
yAxisLinearBearingToBracketClearence = 10;
// Y axis linear rail length (mm)
yAxisLinearRailLength = 330;
// X axis linear rail length (mm)
xAxisLinearRailLength = 330;
yAxisRailMountBuffer = 10;
// linear bearing type
linearBearingType = "LM-8-UU"; // [LM-8-UU:lm8uu]

/* [Belt] */
beltIdlerPulleyH = 8.4;
beltIdlerPulleyD = 6.3;
beltIdlerPulleyLidD = 12.6;
beltIdlerPulleyBearingID = 3;
beltH = 6;
// belt pulley
beltPulleyLidD = 16;
beltPulleyH = 16;
beltPulleyGearedD = 12.2;
beltPulleyShaftD = 5;
beltPulleyLidH = 1;

/* [Linear Bearings] */

// linear bearing outer diameter (mm)
linearBearingOD = 15;
// linear bearing length (mm)
linearBearingLength = 24;
// linear bearing zip tie width (mm)
linearBearingZipTieWidth = 3;
// linear bearing zip tie height (mm)
linearBearingZipTieHeight = 1.5;
// linear bearing holder shell thickness (mm)
linearBearingHolderShellThickness = 6;


/* [Y Carriages] */

// y carriage shelf length (mm), where x rails mount
yCarriageShelfLength = 50;


/* [X Carriages] */
// laser heatsink x (mm)
laserHeatsinkX = 22;
// laser heatsink y (mm)
laserHeatsinkY = 27;
// laser heatsink x (mm)
laserHeatsinkZ = 58;
// laser diameter (mm)
laserDiameter = 12;


/* [Misc] */

// interference fit adjustment for 3D printer
iFitAdjust = .4;
iFitAdjust_d = .25;
// cylinder subtract height extension
cylHeightExt = .1; // for overcutting on differences so they render correctly, nothing more
// render quality
$fn = 64; // [24:low quality, 48:development, 64:production]


/* [Computed Constants] */
// constants computed from the above
reinforcedPlateThickness = plateThickness * reinforcedPlateScale;
yAxisRailMountWidth = linearBearingOD + (linearBearingOD - linearRailOD);
yAxisRailMountHeight = yAxisRailSep + 
     (.5 * linearBearingOD) + // to account for the required spacing of the bearings 
     yAxisRailMountBuffer;
// bracket corner length
cornerLength = 70.7 + 2 * beamHW; // 70.7 is a and b length of c = 10 (inner braces), 2*beam is an estimate of how far out the angle / beam sticks

// for linear rail bearing mounts
effectiveLinearRailOD = linearRailOD + iFitAdjust * 10; 
effectiveLinearBearingOD = linearBearingOD + iFitAdjust;
effectiveLinearBearingLength = linearBearingLength + iFitAdjust;
effectiveLinearBearingZipTieWidth = linearBearingZipTieWidth + iFitAdjust;
effectiveLinearBearingZipTieHeight = linearBearingZipTieHeight + iFitAdjust;
holderBaseWidth = effectiveLinearBearingOD + 4 * plateThickness;
holderBaseLength = effectiveLinearBearingLength + 4 * plateThickness;
yCarriageBraceLength = holderBaseLength * 2 - 2 * plateThickness;



/* [X Axis Rails] */ // this needs to be properly integrated into the above
xAxisRailSep = laserHeatsinkY * 1.5 + yAxisRailMountBuffer;
xAxisRailTightScrewDepth = yAxisRailTightScrewDepth;
xAxisRailTightScrewD = yAxisRailTightScrewD;
xAxisRailTightCaptiveNutWidth = yAxisRailTightCaptiveNutWidth;
xAxisRailTightCaptiveNutHeight = yAxisRailTightCaptiveNutHeight;
xAxisSupportConeLength = 20;
xAxisRailMountWidth = linearBearingOD + (linearBearingOD - linearRailOD);
xAxisRailMountHeight = xAxisRailSep + 
     (.5 * linearBearingOD) + // to account for the required spacing of the bearings 
     yAxisRailMountBuffer;



////////////////////// End header ////////////////////

use <makerBeam.scad>;
use <linearBearing.scad>;
include <MCAD/stepper.scad>


render_part();

module render_part() {
	if (part == "assembly") {
		assembly();
	} else if (part == "breamFrame") {
		beamFrame();
	} else if (part == "topNegXNegYCornerBracket") {
		topNegXNegYCornerBracket();
	} else if (part == "topPosXNegYCornerBracket") {
		topPosXNegYCornerBracket();
	} else if (part == "topNegXPosYCornerBracket") {
		topNegXPosYCornerBracket();
	} else if (part == "topPosXPosYCornerBracket") {
		topPosXPosYCornerBracket();
    } else if (part == "yAxisLinearRails") {
        yAxisLinearRails();
    } else if (part == "xAxisLinearRails") {
        xAxisLinearRails();
	} else if (part == "linearBearingHolder") {
		linearBearingHolder();
	} else if (part == "yCarriage") {
		yCarriage();
	} else if (part == "laserHeatsink") {
		laserHeatsink();
	} else if (part == "xCarriage") {
		xCarriage();
	} else if (part == "beltPulley") {
		beltPulley();
	} else if (part == "beltIdlerPulley") {
		beltIdlerPulley();
	} else if (part == "negXStepperMount") {
		negXStepperMount();
	} else {
		// invalid value
	}
}

module assembly() {
    union() {
        beamFrame();
        topNegXNegYCornerBracket();
        topPosXNegYCornerBracket();
        topNegXPosYCornerBracket();
        topPosXPosYCornerBracket();
		yAxisLinearRails();
		xAxisLinearRails();
		renderNegYCarriage();
		renderPosYCarriage();
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
                translate([ i * frameSideLength / 2, j * frameSideLength / 2, k * frameSideLength / 2])
					cube([beamHW, beamHW, beamHW], center=true);
        }
    
}

// if includeSupportCones is false, supportConeLength must be 0 
// is there an assert in openscad?
module parallelRailsMount(axisRailMountHeight, axisRailMountWidth, axisRailSep, axisRailTightScrewDepth, axisRailTightScrewD, axisRailTightCaptiveNutWidth, axisRailTightCaptiveNutHeight, includeSupportCones, supportConeLength) {
		difference() {
		  	union() {
                // both hulls set out the rail to bracket mounts
        		for (i=[-1, 1])
        			hull() {
						linear_extrude(height=plateThickness + beamHW)
            				polygon(points=[ [0, axisRailMountHeight/2], [-axisRailMountWidth/2, axisRailMountHeight / 2], [-axisRailMountWidth/2, -axisRailMountHeight / 2], [0, -axisRailMountHeight / 2] ], convexity = 10);
						translate([-axisRailMountWidth/2, i * axisRailSep/2, 0])
							cylinder(h=plateThickness + beamHW, d=linearRailOD * 2);
						if (includeSupportCones) {
							translate([-cylHeightExt, i * axisRailSep/2, -supportConeLength])
								cylinder(h=cylHeightExt / 2, d=cylHeightExt / 2);
						}
					}
			}
			// rail holes
        	for (i=[-1, 1])
				translate([- axisRailMountWidth / 2, i * axisRailSep / 2, 
						- cylHeightExt / 2])
					cylinder(h=plateThickness + beamHW + cylHeightExt, d=linearRailOD);
			if (includeSupportCones) {
				depth = plateThickness + beamHW + supportConeLength / 2 + cylHeightExt;
        		for (i=[-1, 1])
					translate([- axisRailMountWidth / 2,
							i * axisRailSep / 2, 
							supportConeLength / 8 - cylHeightExt / 2
								- depth])
						// # this is an interesting piece... not ready to give up the #
						#cylinder(h=depth, d=linearRailOD);
			}
			// slots for tightening
			translate([-axisRailMountWidth/2, 0, beamHW / 2 + plateThickness / 2 + cylHeightExt / 4])
				cube([1.5, axisRailSep, plateThickness + beamHW + cylHeightExt], center = true);
            // separation slot between holes
            translate([-axisRailMountWidth * .75, 0, beamHW / 2 + plateThickness / 2 + cylHeightExt / 4])
				cube([10, 2, plateThickness + beamHW + cylHeightExt], center = true);
			// screw holes for tightenging
        	for (i=[-1, 1])
				translate([-axisRailMountWidth * .6, i * axisRailSep/4, beamHW / 2 + plateThickness / 2 + cylHeightExt / 4])
					rotate([0, 90, 0])
						cylinder(h=axisRailTightScrewDepth, d=axisRailTightScrewD, center=true);
			// inset for screw
        	for (i=[-1, 1])
				translate([-axisRailMountWidth * .8, i * axisRailSep/4, beamHW / 2 + plateThickness / 2 + cylHeightExt / 4])
					rotate([0, 90, 0])
						cylinder(h=axisRailTightScrewDepth / 3, d=axisRailTightScrewD * 3, center=true);
			// captive nut
        	for (i=[-1, 1])
				translate([-axisRailMountWidth * .3, i * axisRailSep/4, beamHW / 2 + plateThickness / 2 + cylHeightExt / 4])
					rotate([0, 90, 0])
						cube([plateThickness + beamHW + cylHeightExt, axisRailTightCaptiveNutWidth, axisRailTightCaptiveNutHeight], center=true);

		}
}

module yAxisRailMount() {
    union() {
		translate([-yAxisLinearBearingToBracketClearence, 0, 0]) 
			parallelRailsMount(yAxisRailMountHeight, yAxisRailMountWidth, yAxisRailSep, yAxisRailTightScrewDepth, yAxisRailTightScrewD, yAxisRailTightCaptiveNutWidth, yAxisRailTightCaptiveNutHeight, false, 0)
		// now the pieces that join the bracket to the mount
		// first, the primary connection between the mount and the bracket
		#linear_extrude(height=plateThickness + beamHW)
			polygon(points=[ [-plateThickness, yAxisRailMountHeight], [-yAxisLinearBearingToBracketClearence, yAxisRailMountHeight / 2], [-yAxisLinearBearingToBracketClearence, -yAxisRailMountHeight / 2], [-plateThickness, - yAxisRailMountHeight / 2 ] ], convexity=10);
        // wing joining mount to brack for additional stability
        translate([-plateThickness, 0, 0])
		  linear_extrude(height=plateThickness + beamHW)
            polygon(points=[ [0, -yAxisRailMountHeight / 2], [2.5 * yAxisRailMountWidth/2, -yAxisRailMountHeight / 2], [ 4.5 * yAxisRailMountWidth/2, 0 ], [0, 0 ]], convexity=10);
    }
}

module beamBracket90() {
   union() {
       // main triangle and beam overlaps
        linear_extrude(height=plateThickness)
            polygon(points=[ [0,0], [cornerLength, 0], [cornerLength, beamHW], [beamHW, cornerLength], [0, cornerLength] ], convexity = 10);
       // veritcal on one side of 90
        linear_extrude(height=plateThickness + beamHW)
            polygon(points=[ [-plateThickness, -plateThickness ], [cornerLength, -plateThickness], [cornerLength, 0], [0, 0]], convexity = 10);
       // veritcal on other
        linear_extrude(height=plateThickness + beamHW)           
            polygon(points=[ [-plateThickness, -plateThickness ], [-plateThickness,cornerLength], [0, cornerLength], [0, 0]], convexity = 10);
  
    // another main triangle
    rotate([90, 0, 0]) translate([0, plateThickness, 0]) 
        difference() {
            linear_extrude(height=plateThickness)
                polygon(points=[ [0,0], [cornerLength, 0], [cornerLength, beamHW], [beamHW, cornerLength], [0, cornerLength] ], convexity = 10);     
			translate([cornerLength, cornerLength, plateThickness / 2])
				cylinder(h=plateThickness + cylHeightExt, r = cornerLength / 1.2 , center=true);
		}
    // another main triangle
    translate([0, plateThickness, 0]) rotate([0, -90, 0]) translate([plateThickness, -plateThickness, 0]) linear_extrude(height=plateThickness)
            polygon(points=[ [0,-plateThickness], [cornerLength, -plateThickness], [cornerLength, beamHW], [beamHW, cornerLength], [0, cornerLength] ], convexity = 10);     
                }
}

module topPosXNegYCornerBracket() {
    mirror([1,0,0]) topNegXNegYCornerBracket();
}

module topNegXPosYCornerBracket() {
    mirror([0,1,0]) topNegXNegYCornerBracket();
}

module topPosXPosYCornerBracket() {
    mirror([1,0,0]) topNegXPosYCornerBracket();
}

module topNegXNegYCornerBracket() {
     fSLTrnas = frameSideLength / 2 + beamHW / 2; // Translation distant to put brack on the outside of frame
    color([.6, .6, 0]) {
    translate([-fSLTrnas, -fSLTrnas, fSLTrnas]) 
        translate([0, -plateThickness, 0])
            rotate([-90, 0, 0]) 
                union() {
                    beamBracket90();
                    yAxisRailMount();
                }
    }
}

module yAxisLinearRails() {
	color([.75,.75,.75])
	union() {
		// one side
		translate([-yAxisRailMountWidth + plateThickness / 4 - yAxisLinearBearingToBracketClearence, 0, yAxisRailSep / 2]) translate([-frameSideLength/2 + beamHW / 2, 0, frameSideLength/2 + beamHW / 2]) rotate([90, 0, 0]) cylinder(h=yAxisLinearRailLength, d=linearRailOD, center=true);
		translate([-yAxisRailMountWidth + plateThickness / 4- yAxisLinearBearingToBracketClearence , 0, -yAxisRailSep / 2]) translate([-frameSideLength/2 + beamHW / 2, 0, frameSideLength/2 + beamHW / 2]) rotate([90, 0, 0]) cylinder(h=yAxisLinearRailLength, d=linearRailOD, center=true);
		// the other
		translate([yAxisRailMountWidth / 2 + yAxisLinearBearingToBracketClearence, 0, yAxisRailSep / 2]) translate([frameSideLength/2 + beamHW / 2, 0, frameSideLength/2 + beamHW / 2]) rotate([90, 0, 0]) cylinder(h=yAxisLinearRailLength, d=linearRailOD, center=true);
		translate([yAxisRailMountWidth / 2 + yAxisLinearBearingToBracketClearence, 0, -yAxisRailSep / 2]) translate([frameSideLength/2 + beamHW / 2, 0, frameSideLength/2 + beamHW / 2]) rotate([90, 0, 0]) cylinder(h=yAxisLinearRailLength, d=linearRailOD, center=true);
	}
}

module xAxisLinearRails() {
	color([.75,.75,.75])
	union() {
        for (i=[-1, 1])
			translate([0, i * ((laserHeatsinkY / 2) + reinforcedPlateThickness * 2), frameSideLength / 2])
				rotate([0, 90, 0])
					cylinder(h=xAxisLinearRailLength, d=linearRailOD, center=true);
	}
}

module zipTieSlots() {
	zipTieRingOD = effectiveLinearBearingOD + plateThickness / 2 + linearBearingZipTieHeight * 2;
	zipTieRingID = effectiveLinearBearingOD + plateThickness / 2;
	zipTieRingOffset = effectiveLinearBearingOD / 2;
	difference() {
		hull() {
			cylinder(h = linearBearingZipTieWidth + 2 * iFitAdjust, d = zipTieRingOD);
			translate([0, zipTieRingOffset, 0])
				cylinder(h = linearBearingZipTieWidth + 2 * iFitAdjust, d = zipTieRingOD);
		}
		hull() {
			cylinder(h = linearBearingZipTieWidth + 2 * iFitAdjust, d = zipTieRingID);
			translate([0, zipTieRingOffset, 0])
				cylinder(h = linearBearingZipTieWidth + 2 * iFitAdjust, d = zipTieRingID);
		}
	}
}

module linearBearingHolder() {
	difference() {
		difference() {
			hull() {
				// base
				cube([holderBaseWidth, holderBaseLength, plateThickness], center=true);
				// outer shell
				translate([0, 0, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
					rotate([-90, 0, 0])
						cylinder(h = effectiveLinearBearingLength + linearBearingHolderShellThickness,
							d = effectiveLinearBearingOD + linearBearingHolderShellThickness, center=true);
			}
			// subtract bearing
			translate([0, 0, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
				rotate([-90, 0, 0])
					cylinder(h = effectiveLinearBearingLength, d = effectiveLinearBearingOD, center=true);
			// subtract shaft itself
			translate([0, 0, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
				rotate([-90, 0, 0])
					cylinder(h = holderBaseLength * 2, d = effectiveLinearRailOD, center=true);
		}
		// zip tie slots
		translate([0, effectiveLinearBearingLength / 3, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
			rotate([-90, 0, 0])
				translate([0, 0, -(linearBearingZipTieWidth + 2 * iFitAdjust)/2])
					zipTieSlots();
		translate([0, -effectiveLinearBearingLength / 3, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
			rotate([-90, 0, 0])
				translate([0, 0, -(linearBearingZipTieWidth + 2 * iFitAdjust)/2])
					zipTieSlots();
		// chop top
		translate([-holderBaseWidth / 2, -holderBaseLength / 2, 
				effectiveLinearBearingOD / 2 + 
					linearBearingHolderShellThickness / 2  + plateThickness / 3])
			cube([effectiveLinearBearingOD + 4 * plateThickness,
				effectiveLinearBearingLength + 4 * plateThickness, effectiveLinearBearingOD]);
	}
}

module yCarriageBrace() {
	// create the brace and remove the holes for the linear rail
	difference() {
		// brace
		union() {
		  hull() {
			translate([-holderBaseWidth / 2, -holderBaseLength * .5, 0])
				cube([(holderBaseWidth * 2 - plateThickness / 2) * .5, 
					reinforcedPlateThickness, 
					effectiveLinearBearingOD + linearBearingHolderShellThickness / 1.5]);
			translate([yAxisRailSep, -holderBaseLength / 2 + reinforcedPlateThickness, 
					effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
				rotate([90, 0, 0])
					cylinder(h=reinforcedPlateThickness, d=linearRailOD * 2);
			// toe to make the hull go to the foot of the plate 
			translate([-holderBaseWidth / 2, -holderBaseLength * .5, 0])
				cube([(holderBaseWidth * 2 - plateThickness / 2), 
					reinforcedPlateThickness, 
					plateThickness / 2]);
		   }
			// shell for brace arc
			difference() {
				translate([-holderBaseWidth * .2,
						-holderBaseLength / 2 + reinforcedPlateThickness, 
						effectiveLinearBearingOD + linearBearingHolderShellThickness + plateThickness])
					rotate([90, 0, 0])
						rotate_extrude(angle=-180, convexity = 10)
							polygon(points=[ [linearRailOD, 0], 
								[linearRailOD - 2, 0], 
								[linearRailOD - 2, reinforcedPlateThickness], 
								[linearRailOD, reinforcedPlateThickness]]);
				translate([-holderBaseWidth * .2,
						-holderBaseLength / 2 + reinforcedPlateThickness, 
						effectiveLinearBearingOD + linearBearingHolderShellThickness + plateThickness])
					rotate([90, 0, 0])
						rotate_extrude(angle=-90, convexity = 10)
							polygon(points=[ [linearRailOD, 0], 
								[linearRailOD - 2, 0], 
								[linearRailOD - 2, reinforcedPlateThickness], 
								[linearRailOD, reinforcedPlateThickness]]);
			}
		}
		// linear rail holes
		translate([0, -holderBaseLength / 2 + reinforcedPlateThickness + cylHeightExt / 2, 
				effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
			rotate([90, 0, 0])
				cylinder(h=reinforcedPlateThickness + cylHeightExt, d=effectiveLinearRailOD);
		translate([yAxisRailSep, -holderBaseLength / 2 + reinforcedPlateThickness + cylHeightExt / 2, 
				effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
			rotate([90, 0, 0])
				cylinder(h=reinforcedPlateThickness + cylHeightExt, d=effectiveLinearRailOD);
	}
}

module yCarriage() {
	difference() {
		union() {
			// plate
			//cube([yAxisRailMountHeight, yAxisRailMountHeight, plateThickness], center=false);
    		// four bearing mounts for y axis (2 on each rail)
			linearBearingHolder();
			translate([yAxisRailSep, 0, 0])
				linearBearingHolder();
			translate([0, holderBaseLength - 2 * plateThickness, 0])
				linearBearingHolder();
			translate([yAxisRailSep, holderBaseLength - 2 * plateThickness, 0])
				linearBearingHolder();
    		// 90 angle for x axis
			translate([-holderBaseWidth / 2, -holderBaseLength / 2, 0])
				cube([reinforcedPlateThickness, yCarriageBraceLength, yCarriageShelfLength]);
			// braces for the carriage
			yCarriageBrace();
			translate([0, yCarriageBraceLength / 2 - reinforcedPlateThickness / 2, 0])
				yCarriageBrace();
			translate([0, yCarriageBraceLength - reinforcedPlateThickness, 0])
				yCarriageBrace();
			// xAxis rails
			// bring y to axis sep / 2
			translate([0, -holderBaseWidth, yCarriageShelfLength / 3])
			// bring y to center of carriage (0)
			translate([0, yCarriageBraceLength / 2 - plateThickness / 1.5, 0])
			translate([-holderBaseWidth / 2, -holderBaseLength * .5, 0])
				// align y to 0
				translate([0, xAxisRailMountHeight / 2 + plateThickness + linearRailOD -linearBearingLength / 2, yCarriageShelfLength * .3])
				rotate([0, 0, 180])
					parallelRailsMount(xAxisRailMountHeight, xAxisRailMountWidth, xAxisRailSep, xAxisRailTightScrewDepth, xAxisRailTightScrewD, xAxisRailTightCaptiveNutWidth, xAxisRailTightCaptiveNutHeight, true, xAxisSupportConeLength);
		}
		// holes for mounting xaxis
	}
}

module renderNegYCarriage() {
	// move from frame to rails
	//translate([-yAxisRailMountWidth + plateThickness / 4 - yAxisLinearBearingToBracketClearence, 0, 0])
	// bring to frame
	//translate([-frameSideLength / 2, 0, frameSideLength / 2])
	// these translates center the piece

/*
	translate([-plateThickness - effectiveLinearBearingOD / 2 - linearBearingHolderShellThickness / 2, 0, 0])
	translate([0, 0, holderBaseWidth / 2])
	translate([0, -yCarriageBraceLength / 2, 0])
		translate([plateThickness / 2, holderBaseLength / 2, 0])
*/
	
	translate([-yAxisRailMountWidth + plateThickness / 4 - yAxisLinearBearingToBracketClearence, 0, yAxisRailSep / 2]) translate([-frameSideLength/2 + beamHW / 2, 0, frameSideLength/2 + beamHW / 2])
		translate([-(effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5), -holderBaseLength / 2 + plateThickness, 0])
			rotate([0, 90, 0])
				renderYCarriage();
}

module renderPosYCarriage() {
	mirror([-1, 0, 0]) renderNegYCarriage();
}

module renderYCarriage() {
	yCarriage();
	color([.75, .75, .75])
		union() {
			// linear bearings
			translate([0, 0, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
				rotate([-90, 0, 0])
					linear_bearing(linearBearingType);
			translate([0, holderBaseLength - 2 * plateThickness, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
				rotate([-90, 0, 0])
					linear_bearing(linearBearingType);
			translate([yAxisRailSep, 0, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
				rotate([-90, 0, 0])
					linear_bearing(linearBearingType);
			translate([yAxisRailSep, holderBaseLength - 2 * plateThickness, effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
				rotate([-90, 0, 0])
					linear_bearing(linearBearingType);
		}
}

module laserHeatsink() {
laserHeatsinkMountScrewD = 3;
laserHeatsinkMountScrewX = 3.5;
laserHeatsinkMountScrewZ = 10;
laserHeatsinkMountScrewLength = 8;
laserDiodeD = 12;
laserHeatsinkDiodeCenterOffset = laserHeatsinkY / 5;
laserHeatsinkWireholeD = 5;
laserHeatsinkWireslotX = 10;
laserHeatsinkWireslotY = 5;
laserHeatsinkWireslotOffset = 8;
	color([0.72, 0.72, 0.72])
		union() {
			difference() {
				cube([laserHeatsinkX, laserHeatsinkY, laserHeatsinkZ], center=true);
            	for (i=[-1, 1])  for (j=[-1, 1])
					translate([i * (laserHeatsinkX / 2) + (-i * laserHeatsinkMountScrewX),
						laserHeatsinkY / 2,
						j * (laserHeatsinkZ / 2) + (-j * laserHeatsinkMountScrewZ)])
						rotate([-90, 0, 0])
							cylinder(h=laserHeatsinkMountScrewLength, 
								d=laserHeatsinkMountScrewD, center=true);
				translate([0, -laserHeatsinkDiodeCenterOffset / 2, 0])
					cylinder(h = laserHeatsinkZ + cylHeightExt, d = laserDiodeD, center=true);
				translate([0, laserHeatsinkY / 2, 0], center=true)
					rotate([-90, 0, 0])
						cylinder(h = laserHeatsinkMountScrewLength, 
							d = laserHeatsinkWireholeD, center=true);
				translate([0, laserHeatsinkWireslotOffset, 0])
					cube([laserHeatsinkWireslotX, laserHeatsinkWireslotY, 
						laserHeatsinkZ + cylHeightExt], center = true);
			}
		}
}

module beltPulley() {
	color([0.7, 0.7, 0.7]) 
	difference() {
		translate([0, 0, beltPulleyH / 2]) // now center
		translate([0, 0, -beltH / 2])	// place pulley to at origin
		union() {
			cylinder(d=beltPulleyGearedD, h=beltH, center=true);
			translate([0, 0, beltH / 2 - beltPulleyLidH / 2]) 
				cylinder(d=beltPulleyLidD, h=beltPulleyLidH, center=true);
			translate([0, 0, -beltH / 2 - (beltPulleyH - beltH) / 2]) 
				cylinder(d=beltPulleyLidD, h=beltPulleyH - beltH, center=true);
		}
		cylinder(d=beltPulleyShaftD, h = beltPulleyH + cylHeightExt, center = true);
	}
}

module beltIdlerPulley() {
	color([0.7, 0.7, 0.7]) {
		difference() {
			union() {
				cylinder(h=beltPulleyH, d=beltPulleyD, center=true);
			}
			cylinder(h=beltIdlerPulleyH * 2, d=beltIdlerPulleyBearingID, center=true);
		}
	}
}

module negXStepperMount() {
	union () {
		//motor(Nema17, orientation=[0, -180, 0]);
	}
}
