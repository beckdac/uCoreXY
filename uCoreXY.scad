// Requires OpenSCAD 2016.3+

/* [Main] */

// select part
part = "assembly";
//part = "yCarriage";
//part = "xCarriage";
//part = "renderXCarriage";
//part = "renderPosYCarriage";
//part = "topNegXNegYCornerBracket";
//part = "xStepperMount";
//part = "negXStepperMount";
//part = "negXPulleyMount";
//part = "posXPulleyMount";
//part = "beltIdlerPulley";
//part = "carriageIdlerPulleyHousing";
//part = "renderYCarriageIdlerPulleyHousing";
//part = "xPulleyHousing";
//part = "negXPulleyMount";
//part = "xCarriageBeltMount";
//part = "xCarriageTop";
// [assembly:all parts assembled, beamFrame:beam frame, topNegXNegYCornerBracket:top corner bracket (-x -y), topPosXNegYCornerBracket:top corner bracket (x -y), topNegXPosYCornerBracket:top corner bracket (-x y), topPosXPosYCornerBracket (x y), yAxisLinearRails:y axis linear rails, xAxisLinearRails:x axis linear rails, yCarriage:y axis carriage]
// height and width of extrusion (mm)
beamHW = 10;
// plate thicknesses (mm) where not otherwise specified
plateThickness = 4;
// reinforced plate thickness scale applied to normal plate thickness where more strength required
reinforcedPlateScale = 1.2;

/* [Misc] */

// interference fit adjustment for 3D printer
iFitAdjust = .4;
// cylinder subtract height extension
cylHeightExt = .1; // for overcutting on differences so they render correctly, nothing more
// render quality
$fn = 64; // [24:low quality, 48:development, 64:production]


/* [Frame] */

// frame beam length (mm)
frameBeamLength = 300;
frameSideLength = frameBeamLength + 2 * 0.5 * beamHW; // this accounts for two corner cubes (2 at half width)
// frame beam height (mm)
frameBeamHeight = 100;
frameSideHeight = frameBeamHeight + 2 * 0.5 * beamHW; // this accounts for two corner cubes (2 at half width)

/* [Rails] */

// linear rail outer diameter (mm)
linearRailOD = 8;
// Y axis linear rail to linear rail separation (center to center, mm)
yAxisRailSep = 30;
// Y axis linear rail mount tighenting screw diameter (mm)
yAxisRailTightScrewD = 3;
yAxisRailTightScrewDepth = 12;
yAxisRailTightCaptiveNutWidth = 6.7;
yAxisRailTightCaptiveNutHeight = 4;
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
/* old for 16 tooth
beltIdlerPulleyLidH = 1;
//beltIdlerPulleyH = 8.4;
beltIdlerPulleyH = 8.4 - beltIdlerPulleyLidH * 2;
beltIdlerPulleyD = 6.3;
beltIdlerPulleyLidD = 12.6;
beltIdlerPulleyBearingID = 3;
beltIdlerPulleyBearingScrewD = beltIdlerPulleyBearingID + iFitAdjust;
beltIdlerPulleyHousingScrewD = beltIdlerPulleyBearingScrewD;
beltIdlerPulleyHousingPulleySpacerHeight = 2;
beltIdlerPulleyHousingPulleySpacerD = 4.4;
*/
/* for 20 tooth compatible dimensions */
beltIdlerPulleyLidH = 1;
//beltIdlerPulleyH = 8.4;
beltIdlerPulleyH = 9;// - beltIdlerPulleyLidH * 2;
beltIdlerPulleyD = 12.2;
beltIdlerPulleyLidD = 18;
beltIdlerPulleyBearingID = 3;
beltIdlerPulleyBearingScrewD = beltIdlerPulleyBearingID + iFitAdjust;
beltIdlerPulleyHousingScrewD = beltIdlerPulleyBearingScrewD;
beltIdlerPulleyHousingPulleySpacerHeight = 2;
beltIdlerPulleyHousingPulleySpacerD = 4.4;
beltH = 6;
beltThickness = 1.5;
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
// y carriage idler housing
carriageIdlerPulleyHousingWidth = beltIdlerPulleyD + 2.5;
carriageIdlerPulleyHousingLength = carriageIdlerPulleyHousingWidth;
carriageIdlerPulleyHousingCylD = beltIdlerPulleyHousingScrewD + plateThickness / 2;

/* [X Carriages] */
// laser heatsink x (mm)
laserHeatsinkX = 22;
// laser heatsink y (mm)
laserHeatsinkY = 27;
// laser heatsink x (mm)
laserHeatsinkZ = 58;
// laser diameter (mm)
laserDiameter = 12;
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

// belt clip on X Carriage
beltMountClipX = 20;
beltMountClipY = 20;
//beltMountClipZ = beltH + beltIdlerPulleyHousingPulleySpacerHeight * 2;
// for testing
beltMountClipZ = beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight * 2;
beltMountClipTensionSheetThickness = plateThickness / 2;
beltMountClipTensionScrewD = 3;
beltMountClipTensionScrewNutWidth = 3;
beltMountCaptiveNutWidth = yAxisRailTightCaptiveNutWidth;
beltMountCaptiveNutHeight = yAxisRailTightCaptiveNutHeight;
beltMountScrewD = 3;


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
effectiveLinearBearingOD = linearBearingOD + iFitAdjust * 2;
effectiveLinearBearingLength = linearBearingLength + iFitAdjust * 2;
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


// pulley housings
xPulleyMountPlateHeight = 
	reinforcedPlateThickness
	+ 2 * beltIdlerPulleyH
	+ 3 * beltIdlerPulleyHousingPulleySpacerHeight;


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
	} else if (part == "xStepperMount") {
		xStepperMount();
	} else if (part == "negXStepperMount") {
		negXStepperMount();
	} else if (part == "posXStepperMount") {
		posXStepperMount();
	} else if (part == "xPulleyMount") {
		xPulleyMount();
	} else if (part == "negXPulleyMount") {
		negXPulleyMount();
	} else if (part == "posXPulleyMount") {
		posXPulleyMount();
	} else if (part == "renderPosYCarriage") {
		renderPosYCarriage();
	} else if (part == "renderNegYCarriage") {
		renderNegYCarriage(0);
	} else if (part == "renderXCarriage") {
		renderXCarriage();
	} else if (part == "carriageIdlerPulleyHousing") {
		carriageIdlerPulleyHousing();
	} else if (part == "renderYCarriageIdlerPulleyHousing") {
		renderYCarriageIdlerPulleyHousing();
	} else if (part == "xPulleyHousing") {
		xPulleyHousing();
	} else if (part == "xCarriageBeltMount") {
		xCarriageBeltMount();
	} else if (part == "negXCarriageBeltMount") {
		negXCarriageBeltMount();
	} else if (part == "posXCarriageBeltMount") {
		posXCarriageBeltMount();
	} else if (part == "xCarriageTop") {
		xCarriageTop();
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
		renderNegYCarriage(-90);
		renderPosYCarriage();
		renderXCarriage();
		negXStepperMount();
		posXStepperMount();
		negXPulleyMount();
		posXPulleyMount();
    }
}

module beamFrame() {
    color([.6, .6, .6, .6]) 
        union() {
            for (i=[-1, 1])
				for (j=[-1,1])
                	translate([i * frameSideLength / 2, j * frameSideLength / 2, 0])
						makerBeam(frameBeamHeight);            
            for (i=[-1, 1])
				for (j=[-1,1])
            		translate([i * frameSideLength / 2, 0, j * frameSideHeight / 2])
						rotate([90, 0, 0])
							makerBeam(frameBeamLength);
            for (i=[-1, 1])
				for (j=[-1,1])
            		translate([0, i * frameSideLength / 2, j * frameSideHeight / 2])
						rotate([0, 90, 0])
							makerBeam(frameBeamLength);
            for (i=[-1,1]) for (j=[-1,1]) for (k=[-1,1])
                translate([ i * frameSideLength / 2, j * frameSideLength / 2, k * frameSideHeight / 2])
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
						// this is an interesting piece... not ready to give up the number 
						cylinder(h=depth, d=linearRailOD);
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
			parallelRailsMount(yAxisRailMountHeight, yAxisRailMountWidth, yAxisRailSep, yAxisRailTightScrewDepth, yAxisRailTightScrewD, yAxisRailTightCaptiveNutWidth, yAxisRailTightCaptiveNutHeight, false, 0);
		// now the pieces that join the bracket to the mount
		// first, the primary connection between the mount and the bracket
		linear_extrude(height=plateThickness + beamHW)
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
    fSHTrnas = frameSideHeight / 2 + beamHW / 2; // Translation distant to put brack on the outside of frame
    color([.6, .6, 0]) {
    translate([-fSLTrnas, -fSLTrnas, fSHTrnas]) 
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
        for (i=[-1, 1]) for (j=[-1, 1])
		translate([i * (yAxisRailMountWidth/2 + yAxisLinearBearingToBracketClearence), 0, j * yAxisRailSep / 2])
			// move out from center and up to top
			translate([i * frameSideLength / 2 + i * beamHW / 2,
					0,
					frameSideHeight / 2 + beamHW / 2])
				rotate([90, 0, 0])
					cylinder(h=yAxisLinearRailLength, d=linearRailOD, center=true);
	}
}

module xAxisLinearRails() {
	color([.75,.75,.75])
	union() {
        for (i=[-1, 1])
			translate([0, i * xAxisRailSep / 2, 
					frameSideHeight / 2 + beamHW / 2 + yAxisRailSep / 2 + holderBaseWidth / 2
					-(xAxisRailMountWidth / 2) - reinforcedPlateThickness])
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
    		// four bearing mounts for y axis (2 on each rail)
            for (i=[0, yAxisRailSep])
				for (j=[0, holderBaseLength - 2 * plateThickness])
					translate([i, j, 0])
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
			translate([reinforcedPlateThickness, 
				-holderBaseWidth,
				yCarriageShelfLength / 3
				])
			// bring y to center of carriage (0)
			translate([0, yCarriageBraceLength / 2 - plateThickness / 1.5, 0])
			translate([-holderBaseWidth / 2, -holderBaseLength * .5, 0])
				// align y to 0
				translate([0, xAxisRailMountHeight / 2 + plateThickness + linearRailOD -linearBearingLength / 2, yCarriageShelfLength / 3])
				rotate([0, 0, 180])
					parallelRailsMount(xAxisRailMountHeight, xAxisRailMountWidth, xAxisRailSep, xAxisRailTightScrewDepth, xAxisRailTightScrewD, xAxisRailTightCaptiveNutWidth, xAxisRailTightCaptiveNutHeight, true, xAxisSupportConeLength);
		}
		// holes for mounting xaxis
	}
}

module renderXCarriage() {
  union() {
	translate([0, 0,
		effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5 +
		plateThickness / 2 +
		frameSideHeight / 2 + beamHW / 2 + yAxisRailSep / 2 + holderBaseWidth / 2
		-(xAxisRailMountWidth / 2)
		-reinforcedPlateThickness
		])
	rotate([0, 180, 90])
		union(){
			xCarriage();
			translate([0, 0, -laserHeatsinkMountScrewZ])
				laserHeatsink();
			color([.75, .75, .75])
			translate([-xAxisRailSep / 2, - ( holderBaseLength - 2 * plateThickness ) / 2, 0])
			union() {
				// linear bearings
				translate([0, 0, plateThickness / 2 + effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
					rotate([-90, 0, 0])
						linear_bearing(linearBearingType);
				translate([0, holderBaseLength - 2 * plateThickness, plateThickness / 2 + effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
					rotate([-90, 0, 0])
						linear_bearing(linearBearingType);
				translate([xAxisRailSep, 0, plateThickness / 2 + effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
					rotate([-90, 0, 0])
						linear_bearing(linearBearingType);
				translate([xAxisRailSep, holderBaseLength - 2 * plateThickness, plateThickness / 2 + effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5])
					rotate([-90, 0, 0])
					linear_bearing(linearBearingType);
			}
		}
	xCarriageBeltMount();
	mirror([0, -1, 0]) mirror([-1, 0, 0]) xCarriageBeltMount();
	xCarriageTop();
  }
}

module negXCarriageBeltMount() {
	xCarraigeBeltMount();
}

module beltMountClip(growUp) {
	union () {
		difference() {
			union() {
				// bulk
				cube([beltMountClipX, beltMountClipY,
					beltMountClipZ], center=true);
				thisHeight = xPulleyMountPlateHeight - reinforcedPlateThickness - beltMountClipZ;
				if (growUp) {
/*
					translate([0,
							0,
							beltMountClipZ / 2 + thisHeight / 2])
						cube([beltMountClipX,
							beltMountClipY,
							thisHeight
							], center = true);
*/
				} else {
					translate([0,
							0,
							-beltMountClipZ / 2 - thisHeight / 2])
						cube([beltMountClipX,
							beltMountClipY,
							thisHeight
							], center = true);
				}
			}
			// belt fastener
			// incoming belt cutout
			translate([beltMountClipX / 8,
						-beltThickness / 2,
						(beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight) / 2 - beltIdlerPulleyH / 2 + beltIdlerPulleyHousingPulleySpacerHeight
						])
				cube([beltMountClipX * .75,
					beltThickness,
					beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt], center=true);
			// outgoing belt cutout
			translate([beltMountClipX / 2 - beltMountClipX * .25 / 2,
						-beltThickness * 1.5,
						(beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight) / 2 - beltIdlerPulleyH / 2 + beltIdlerPulleyHousingPulleySpacerHeight
						])
				cube([beltMountClipX * .25,
					beltThickness,
					beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt], center=true);
			// semi circle
			translate([-beltMountClipX / 4,
					-beltMountClipY / 4,
					(beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight) / 2 - beltIdlerPulleyH / 2 + beltIdlerPulleyHousingPulleySpacerHeight
					])
			difference() {
				difference() {
					cylinder(h=beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt,
						d=beltMountClipY / 2, center=true);
					cylinder(h=beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt,
						d=beltMountClipY / 2 - 2 * beltThickness, center=true);
				}
				translate([+beltMountClipX / 8,
						beltMountClipY / 8 - beltThickness, 0])
					cube([beltMountClipX / 4, beltMountClipY / 4, 
						beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt], center=true);
			}
			// semi circle enlarged cutout for cleanliness
			translate([-beltMountClipX / 4,
					-beltMountClipY / 4,
					(beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight) / 2 - beltIdlerPulleyH / 2 + beltIdlerPulleyHousingPulleySpacerHeight
					])
			intersection() {
				difference() {
					cylinder(h=beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt,
						d=beltMountClipY, center=true);
					cylinder(h=beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt,
						d=beltMountClipY / 2 - 2 * beltThickness, center=true);
				}
				translate([+beltMountClipX / 8 - beltMountClipX / 4,
						beltMountClipY / 8 - beltMountClipY / 4, 0])
					cube([beltMountClipX / 4 + cylHeightExt, beltMountClipY / 4 + cylHeightExt, 
						beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt], center=true);
			}
			//intersecting diagonal to clamp belt
			translate([0, 0, 
					(beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight) / 2 - beltIdlerPulleyH / 2
					- (beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt) / 2
					+ beltIdlerPulleyHousingPulleySpacerHeight
				])
			linear_extrude(height=beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt)
				polygon(points=[[-iFitAdjust, -beltMountClipY / 4 - beltThickness - iFitAdjust],
							[beltMountClipX / 4, -2 * beltThickness],
							[beltMountClipX / 4, 0],
							[-beltThickness * 1.25 - iFitAdjust, 	
								-beltMountClipY / 4 - beltThickness - iFitAdjust]
							]);
		}
	}
}

module xCarriageBeltMount() {
	translate([0, 0,
            yAxisRailSep / 2 - reinforcedPlateThickness / 2 +
                frameSideHeight / 2 + beamHW / 2 +
                holderBaseWidth / 2 + .5
            ])
	translate([laserHeatsinkY,
		0,
		-reinforcedPlateThickness / 2])
	difference() {
	union() {
		translate([0, 
				-beltThickness / 2
					+carriageIdlerPulleyHousingLength / 2
					+beltIdlerPulleyD / 2,
				beltIdlerPulleyH / 2 + reinforcedPlateThickness / 2
				+ beltIdlerPulleyHousingPulleySpacerHeight])
			mirror([0, -1, 0])
				union() {
					beltMountClip(true);
				}
		translate([0, 
				beltThickness / 2
					- carriageIdlerPulleyHousingLength / 2
				    - beltIdlerPulleyD / 2,
				beltIdlerPulleyH / 2 + reinforcedPlateThickness / 2
				+ beltIdlerPulleyH
				+ 2 * beltIdlerPulleyHousingPulleySpacerHeight ])
				union() {
					beltMountClip(false);
				}
		// join the two beltMounts
		joinerWidth = 2 * ((-beltThickness / 2
					+carriageIdlerPulleyHousingLength / 2
					+beltIdlerPulleyD / 2) - beltMountClipY / 2);
		translate([0, 0,
				(xPulleyMountPlateHeight - reinforcedPlateThickness) / 2 +
					reinforcedPlateThickness / 2
				])
			cube([beltMountClipX,
				joinerWidth,
				xPulleyMountPlateHeight - reinforcedPlateThickness], center=true);
	}
		// mounting screws to carriage
		screwHeight = beltMountClipZ * 2 + cylHeightExt;
		for (i = [-1,1])
		translate([0,
				i * beltMountClipY / 3,
				(xPulleyMountPlateHeight - reinforcedPlateThickness) / 2 +
					reinforcedPlateThickness / 2
				])
			cylinder(h=screwHeight,
				d=beltMountScrewD, center=true);
		// slot for zip tie
		for (i = [-1,1])
		translate([-beltMountClipX / 8,
				i * beltMountClipY,
				plateThickness - (linearBearingZipTieHeight + cylHeightExt) / 2
				])
			cube([linearBearingZipTieWidth * 2,
				beltMountClipY / 2,
				linearBearingZipTieHeight + cylHeightExt], center=true);
	}
}

module recessedNut(sides, d, h) {
	cylinder(h=h, d=d, center=true, $fn=sides);
}

module xCarriageTop() {
joinerWidth = 2 * ((-beltThickness / 2
					+carriageIdlerPulleyHousingLength / 2
					+beltIdlerPulleyD / 2) - beltMountClipY / 2);

	translate([0, 0,
            yAxisRailSep / 2 - reinforcedPlateThickness / 2 +
                frameSideHeight / 2 + beamHW / 2 +
                holderBaseWidth / 2 + 1
			+ xPulleyMountPlateHeight - reinforcedPlateThickness - 1
		])
	rotate([0, 0, -90])
	difference() {
		union() {
			translate([0, 0, reinforcedPlateThickness / 2])
				/*
				cube([beltMountClipX * 2 + joinerWidth,
					holderBaseLength * 2 - 2 * plateThickness,
					plateThickness], center=true);
				*/
				hull () {
					// using linearRailOD to round courners, purely aesthetic 
					for (i=[-1,1])
						for (j=[-1,1])
							translate([i * (beltMountClipX * 2 + joinerWidth) / 2 + i * -linearRailOD,
										j * (holderBaseLength * 2 - 2 * plateThickness) / 2 + j * -linearRailOD,
										0
									])
								cylinder(h=plateThickness, d=linearRailOD * 2, center=true);
				}
		}
		// slot for heatsink
		cube([laserHeatsinkX + iFitAdjust, 
			laserHeatsinkY + iFitAdjust, 
			laserHeatsinkZ + iFitAdjust], center=true);
		// holes for mounting
		for (i=[-1, 1])
			for (j=[-1, 1])
				translate([i * beltMountClipX / 3,
						j * beltMountClipY / 3 + j * beltMountClipX,
						reinforcedPlateThickness / 2
					])
					cylinder(h=reinforcedPlateThickness + cylHeightExt, d=beltMountScrewD, center=true);
		for (i=[-1, 1])
			for (j=[-1, 1])
				for (k=[0, 1])
					translate([i * beltMountClipX / 1.25,
							j * beltMountClipY / 3 + j * k * beltMountClipY / 3,
							reinforcedPlateThickness / 2
						])
					cylinder(h=reinforcedPlateThickness + cylHeightExt, d=beltMountScrewD, center=true);
	}
}

module xCarriage() {
	#difference() {
		union() {
			translate([-xAxisRailSep / 2, 
					-holderBaseLength / 2 + plateThickness, plateThickness / 2])
            	for (i=[0, xAxisRailSep])
					for (j=[0, holderBaseLength - 2 * plateThickness])
						translate([i, j, 0])
							linearBearingHolder();
			translate([0, 0, reinforcedPlateThickness / 2])
				cube([xAxisRailSep - holderBaseWidth + plateThickness,
					holderBaseLength * 2 - 2 * plateThickness,
					reinforcedPlateThickness], center=true);
           	for (i=[-1, 1])
				translate([0,
						i * (laserHeatsinkY / 2 + iFitAdjust / 2 + plateThickness / 4),
						laserHeatsinkMountScrewZ * .75])
					difference() {
						cube([laserHeatsinkX * 1.5, plateThickness / 2, laserHeatsinkMountScrewZ * 1.25], center=true);
						for (i=[-1, 1])
							translate([i * (laserHeatsinkX - laserHeatsinkMountScrewX * 2) / 2, 
									0, plateThickness / 2])
								rotate([90, 0, 0])
									cylinder(h=plateThickness / 2 + cylHeightExt,
										d=laserHeatsinkMountScrewD, center=true);
					}
		}
		// slot for heatsink
		cube([laserHeatsinkX + iFitAdjust, 
			laserHeatsinkY + iFitAdjust, 
			laserHeatsinkZ + iFitAdjust], center=true);
		// holes for mounting
		for (i=[-1, 1])
			for (j=[-1, 1])
		translate([i * beltMountClipX / 3,
				j * beltMountClipY / 3 + j * beltMountClipX,
				//(xPulleyMountPlateHeight - reinforcedPlateThickness) / 2 +
					reinforcedPlateThickness / 2
// - (plateThickness + cylHeightExt) / 2
				])
					union() {
						cylinder(h=reinforcedPlateThickness + cylHeightExt, d=beltMountScrewD, center=true);
						translate([0, 0, beltMountCaptiveNutHeight / 1.5])
							recessedNut(6, h=beltMountCaptiveNutHeight, d=beltMountCaptiveNutWidth);
					}
	}
}

module renderNegYCarriage(rotateHousingZAxisAngle) {
  union() {
	translate([-yAxisRailMountWidth + plateThickness / 4 - yAxisLinearBearingToBracketClearence,
			0, yAxisRailSep / 2])
		translate([-frameSideLength / 2 + beamHW / 2, 0, frameSideHeight / 2 + beamHW / 2])
			translate([-(effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5),
					-holderBaseLength / 2 + plateThickness, 0])
				rotate([0, 90, 0])
					renderYCarriage();
	translate([0, 0, 
			yAxisRailSep / 2 - reinforcedPlateThickness / 2 +
				frameSideHeight / 2 + beamHW / 2 +
				holderBaseWidth / 2
			])
		translate([-frameSideLength / 2 -
					effectiveLinearBearingOD / 2 - linearBearingHolderShellThickness / 1.5 + 
					carriageIdlerPulleyHousingWidth / 2,
				0, 0])
			rotate([0, 0, rotateHousingZAxisAngle])
				renderYCarriageIdlerPulleyHousing();
  }
}

module renderPosYCarriage() {
	mirror([-1, 0, 0]) renderNegYCarriage(90);
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
            	for (i=[-1, 1])
				  for (j=[-1, 1])
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
				cylinder(h=beltIdlerPulleyH, d=beltIdlerPulleyD, center=true);
				for (i = [-1,1])
					translate([0, 0, i * beltIdlerPulleyH / 2 + i * -1 * beltIdlerPulleyLidH / 2])
						cylinder(h=beltIdlerPulleyLidH, d=beltIdlerPulleyLidD, center=true);
			}
			cylinder(h=beltIdlerPulleyH * 2, d=beltIdlerPulleyBearingID, center=true);
		}
	}
}

// Nema17 data
stepperWidth = 42.3;
stepperHeight = 34;
stepperMountHoleSpacing = 31;
stepperMountScrewD = 3 + iFitAdjust;
stepperMountScrewDepth = 4.5;
stepperShaftD = 5;
stepperShaftLength = 24;
stepperCollarHeight = 2;
stepperCollarWidth = 22;

xMountStepperBuffer = 2;
xMountWidth = stepperWidth + xMountStepperBuffer + reinforcedPlateThickness * 2;
stepperMountHoleTensionSlotLen = 6;

// this is a generic mount that is based off the nema17 dimensions
// it will also hold the pulley mounts
module xMount() {
	union () {
		// face plate
		cube([xMountWidth, xMountWidth, reinforcedPlateThickness], center=true);
		// corner plate backing
		translate([0, xMountWidth / 2 - reinforcedPlateThickness / 2, stepperHeight * 1.25 / 2])
			cube([xMountWidth, reinforcedPlateThickness, stepperHeight * 1.25], center=true);
		// side supports
		for (i = [-1,1])
			translate()
				hull() {
					translate([i * xMountWidth / 2 - i * reinforcedPlateThickness / 2, 
							xMountWidth / 2 - reinforcedPlateThickness / 2, 
							stepperHeight * 1.25 / 2])
						cube([reinforcedPlateThickness, reinforcedPlateThickness,
							stepperHeight * 1.25], center=true);
					translate([i * xMountWidth / 2 - i * reinforcedPlateThickness / 2, 
							-xMountWidth / 2 + reinforcedPlateThickness / 2, 
							0])
						cube([reinforcedPlateThickness, reinforcedPlateThickness,
							reinforcedPlateThickness], center=true);
				}
	}
}

module xStepperMount() {
	difference() {
		xMount();
		cylinder(h=reinforcedPlateThickness + cylHeightExt, d=stepperCollarWidth * 1.1, center=true);
		for (i = [-1,1])
			for (j = [-1,1])
				translate([i * stepperMountHoleSpacing / 2, j * stepperMountHoleSpacing / 2, 0])
					hull() {
						translate([0, stepperMountHoleTensionSlotLen * .25, 0])
							cylinder(h=reinforcedPlateThickness + cylHeightExt,
								d=stepperMountScrewD, center=true);
						translate([0, -stepperMountHoleTensionSlotLen * .75, 0])
							cylinder(h=reinforcedPlateThickness + cylHeightExt,
								d=stepperMountScrewD, center=true);
					}
	}
}

module negXStepperMount() {

	translate([0, 0, 
		yAxisRailSep / 2 - reinforcedPlateThickness / 2 +
		frameSideHeight / 2 + beamHW / 2 +
		holderBaseWidth / 2
		])
	translate([frameSideLength / 2 +
				effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5,
			-frameSideLength / 2 - xMountWidth / 2 - beamHW / 2 - plateThickness,
			0])
		rotate([180, 0, 180])
			union() {
				xStepperMount();
				translate([0, 0, reinforcedPlateThickness / 2 - stepperCollarHeight])
					rotate([180, 0, 0])
						motor(Nema17, orientation=[0, -180, 0]);
			}
}

module posXStepperMount() {
	mirror([-1, 0, 0])
		negXStepperMount();
}


module xPulleyHousing() {
	translate([0, 0, xPulleyMountPlateHeight])
		difference() {
			union() {
				cube([stepperMountHoleSpacing + reinforcedPlateThickness,
					stepperMountHoleSpacing + reinforcedPlateThickness,
					reinforcedPlateThickness], center=true);
				for (i = [-1,1])
					for (j = [-1,1])
						translate([i * stepperMountHoleSpacing / 2, 
							j * stepperMountHoleSpacing / 2, 0])
							cylinder(h=reinforcedPlateThickness,
								d=beltIdlerPulleyHousingScrewD + plateThickness, center=true);
				translate([0, stepperMountHoleSpacing / 2, -xPulleyMountPlateHeight / 2])
					cube([stepperMountHoleSpacing - beltIdlerPulleyHousingScrewD,
						reinforcedPlateThickness,
						xPulleyMountPlateHeight - reinforcedPlateThickness], center=true);
				translate([stepperMountHoleSpacing / 2, 0, -xPulleyMountPlateHeight / 2])
					cube([reinforcedPlateThickness,
						stepperMountHoleSpacing - beltIdlerPulleyHousingScrewD,
						xPulleyMountPlateHeight - reinforcedPlateThickness], center=true);
				for (i = [-1,1])
					for (j = [-1,1])
						translate([i * stepperMountHoleSpacing / 2, 
							j * stepperMountHoleSpacing / 2, -xPulleyMountPlateHeight / 2])
						difference() {
							cylinder(h=xPulleyMountPlateHeight - reinforcedPlateThickness,
								d=beltIdlerPulleyHousingScrewD + plateThickness, center=true);
							cylinder(h=xPulleyMountPlateHeight - reinforcedPlateThickness + cylHeightExt,
								d=beltIdlerPulleyHousingScrewD, center=true);
						}
			}
		// bearing screw
		cylinder(h=reinforcedPlateThickness + cylHeightExt, 
			d=beltIdlerPulleyBearingScrewD * 1.1, center=true);
		// housing screws
		for (i = [-1,1])
			for (j = [-1,1])
				translate([i * stepperMountHoleSpacing / 2,
						j * stepperMountHoleSpacing / 2, 0])
					cylinder(h=reinforcedPlateThickness + cylHeightExt,
						d=beltIdlerPulleyHousingScrewD, center=true);
		}
}

module xPulleyMount() {
	difference() {
		rotate([180, 0, 0])
			xMount();
		// bearing screw
		cylinder(h=reinforcedPlateThickness + cylHeightExt, 
			d=beltIdlerPulleyBearingScrewD * 1.1, center=true);
		// housing screws
		for (i = [-1,1])
			for (j = [-1,1])
				translate([i * stepperMountHoleSpacing / 2,
						j * stepperMountHoleSpacing / 2, 0])
					cylinder(h=reinforcedPlateThickness + cylHeightExt,
						d=beltIdlerPulleyHousingScrewD, center=true);
	}
}

module negXPulleyMount() {
	translate([0, 0, 
		yAxisRailSep / 2 - reinforcedPlateThickness / 2 +
		frameSideHeight / 2 + beamHW / 2 +
		holderBaseWidth / 2
		])
	translate([frameSideLength / 2 +
			effectiveLinearBearingOD / 2 + linearBearingHolderShellThickness / 1.5,
		frameSideLength / 2 + xMountWidth / 2 + beamHW / 2 + plateThickness,
		0])
	union() {
		xPulleyMount();
		xPulleyHousing();
		// pulleys
		translate([0, 0,
				beltIdlerPulleyH / 2 + reinforcedPlateThickness / 2
				+ beltIdlerPulleyHousingPulleySpacerHeight])
			beltIdlerPulley();
		translate([0, 0,
				beltIdlerPulleyH / 2 + reinforcedPlateThickness / 2
				+ beltIdlerPulleyH
				+ 2 * beltIdlerPulleyHousingPulleySpacerHeight ])
			beltIdlerPulley();
		// spacers
		translate([0, 0,
				reinforcedPlateThickness / 2 + beltIdlerPulleyHousingPulleySpacerHeight / 2
				])
		pulleySpacer();
		translate([0, 0,
				reinforcedPlateThickness / 2 + beltIdlerPulleyHousingPulleySpacerHeight / 2 +
				beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight
				])
		pulleySpacer();
		translate([0, 0,
				reinforcedPlateThickness / 2 + beltIdlerPulleyHousingPulleySpacerHeight / 2 +
				2 * beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight * 2
				])
		pulleySpacer();
	}
}

module posXPulleyMount() {
	mirror([-1, 0, 0])
		negXPulleyMount();
}

module pulleyHousingSpacer() {
	difference() {
		cylinder(h=beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight, 
			d=carriageIdlerPulleyHousingCylD, center=true);
		cylinder(h=beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt, 
			d=beltIdlerPulleyHousingScrewD, center=true);
	}
}

module pulleySpacer() {
	difference() {
		cylinder(h=beltIdlerPulleyHousingPulleySpacerHeight, 
			d=beltIdlerPulleyHousingPulleySpacerD, center=true);
		cylinder(h=beltIdlerPulleyHousingPulleySpacerHeight + cylHeightExt, 
			d=beltIdlerPulleyHousingScrewD, center=true);
	}
}

module renderYCarriageIdlerPulleyHousing() {
	union() {
		// pulleys
		translate([carriageIdlerPulleyHousingWidth / 2,
				-carriageIdlerPulleyHousingLength / 2,
				beltIdlerPulleyH / 2 + reinforcedPlateThickness / 2
				+ beltIdlerPulleyHousingPulleySpacerHeight])
			beltIdlerPulley();
		translate([-carriageIdlerPulleyHousingWidth / 2,
				carriageIdlerPulleyHousingLength / 2,
				beltIdlerPulleyH / 2 + reinforcedPlateThickness / 2
				+ beltIdlerPulleyH
				+ 2 * beltIdlerPulleyHousingPulleySpacerHeight ])
			beltIdlerPulley();
		// belts
		translate([-carriageIdlerPulleyHousingWidth / 2 - beltIdlerPulleyD / 2,
			//	carriageIdlerPulleyHousingLength / 2,
				-150/2.5,
				beltIdlerPulleyH / 2 + reinforcedPlateThickness / 2
				+ beltIdlerPulleyH
				+ 2 * beltIdlerPulleyHousingPulleySpacerHeight ])
			cube([beltThickness, 150, beltH], center=true);

		// spacers
		translate([carriageIdlerPulleyHousingWidth / 2,
				-carriageIdlerPulleyHousingLength / 2,
				reinforcedPlateThickness / 2 + beltIdlerPulleyHousingPulleySpacerHeight / 2
				])
			pulleySpacer();
		translate([carriageIdlerPulleyHousingWidth / 2,
				-carriageIdlerPulleyHousingLength / 2,
				reinforcedPlateThickness / 2 + beltIdlerPulleyHousingPulleySpacerHeight / 2 +
				beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight
				])
			pulleySpacer();
		translate([-carriageIdlerPulleyHousingWidth / 2,
				carriageIdlerPulleyHousingLength / 2,
				reinforcedPlateThickness / 2 + beltIdlerPulleyHousingPulleySpacerHeight / 2 +
				beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight
				])
			pulleySpacer();
		translate([-carriageIdlerPulleyHousingWidth / 2,
				carriageIdlerPulleyHousingLength / 2,
				reinforcedPlateThickness / 2 + beltIdlerPulleyHousingPulleySpacerHeight / 2 +
				2 * beltIdlerPulleyH + beltIdlerPulleyHousingPulleySpacerHeight * 2
				])
			pulleySpacer();
		// bigger spacers
		translate([-carriageIdlerPulleyHousingWidth / 2,
				carriageIdlerPulleyHousingLength / 2,
				reinforcedPlateThickness / 2 + (beltIdlerPulleyH + 
					beltIdlerPulleyHousingPulleySpacerHeight) / 2 
				])
			pulleyHousingSpacer();
		translate([carriageIdlerPulleyHousingWidth / 2,
				-carriageIdlerPulleyHousingLength / 2,
				reinforcedPlateThickness / 2 + (beltIdlerPulleyH + 
					beltIdlerPulleyHousingPulleySpacerHeight) / 2 +
				2 * beltIdlerPulleyHousingPulleySpacerHeight + beltIdlerPulleyH 
				])
			pulleyHousingSpacer();

		// now the housing itself
		carriageIdlerPulleyHousing();
	}
}

module carriageIdlerPulleyHousing() {
	translate([0, 0, xPulleyMountPlateHeight])
		difference() {
			union() {
				hull() {
					for (i = [-1,1])
						for (j = [-1,1])
							translate([i * carriageIdlerPulleyHousingWidth / 2,
								j * carriageIdlerPulleyHousingLength / 2, 0])
								cylinder(h=reinforcedPlateThickness,
									d=beltIdlerPulleyHousingScrewD + plateThickness, center=true);
				}
				for (i = [-1,1])
						translate([i * carriageIdlerPulleyHousingWidth / 2,
							i * carriageIdlerPulleyHousingLength / 2, -xPulleyMountPlateHeight / 2])
						difference() {
							union() {
								cylinder(h=xPulleyMountPlateHeight - reinforcedPlateThickness,
									d=carriageIdlerPulleyHousingCylD, center=true);
								// reinforcing cones
								translate([0,
									0,
									(xPulleyMountPlateHeight - reinforcedPlateThickness) / 2 -
									beltIdlerPulleyHousingPulleySpacerHeight / 2
									])
								cylinder(h=beltIdlerPulleyHousingPulleySpacerHeight,
									d1=carriageIdlerPulleyHousingCylD, 
									d2=beltIdlerPulleyHousingScrewD + plateThickness, center=true);
							}
							cylinder(h=xPulleyMountPlateHeight - reinforcedPlateThickness + cylHeightExt,
								d=beltIdlerPulleyHousingScrewD, center=true);
							cylinder(h=xPulleyMountPlateHeight - reinforcedPlateThickness + cylHeightExt,
								d=beltIdlerPulleyHousingScrewD, center=true);
						}
			}
			// housing screws
			for (i = [-1,1])
				for (j = [-1,1])
					translate([i * carriageIdlerPulleyHousingWidth / 2,
							j * carriageIdlerPulleyHousingLength / 2, 0])
						cylinder(h=reinforcedPlateThickness + cylHeightExt,
							d=beltIdlerPulleyHousingScrewD, center=true);
		}
}
