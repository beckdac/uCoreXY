# _u_ CoreXY
## A small framework for coreXY devices.
---

The coreXY arrangement has become a very popular two axis configuration.  It allows the two steppers for the X and Y axes to be in a fixed location off of the gantry carriages.  The minor drawback is that belt routing can be complex.  This implementation uses belts with different heights but the same routing to deal with the overlapping belt problem.  The design was done completely in OpenSCAD.  The toolhead for the reference build is a 2W laser diode from DTR Lasers that is capable of cutting paper, cardboard, and balsa as well as engraving wood and plastics.  Control electronics are RAMPS v1.4 and a C.H.I.P. $9 computer running OctoPrint.  Firmware link will be posted soon - how do you fork the same repo twice in one github account?

The _u_ in the _u_ CoreXY is for micro.  This design uses lightweight 3d printed parts and the 10mm Makerbeam frames.  Normally, these wouldn't be strong enough, but this design uses reinforced corners from 3d printed elements and structural rails for the axes.
 
 ![alt text](https://raw.githubusercontent.com/beckdac/uCoreXY/master/images/uCoreXY.1.png "Reference implementation")
 ![alt text](https://raw.githubusercontent.com/beckdac/uCoreXY/master/images/uCoreXY.2.png "Reference implementation")
 ![alt text](https://raw.githubusercontent.com/beckdac/uCoreXY/master/images/uCoreXY.3.png "Reference implementation")
 ![alt text](https://raw.githubusercontent.com/beckdac/uCoreXY/master/images/uCoreXY.4.png "Reference implementation")
 ![alt text](https://raw.githubusercontent.com/beckdac/uCoreXY/master/images/uCoreXY.png "Reference implementation")

