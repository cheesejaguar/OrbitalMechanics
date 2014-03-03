#!/usr/bin/python                                                                                                               

import numpy as np
import math

## Define constants                                                                                                             
mu = 398600.4418
Re = 6378.1

## Temporary inputs

r1 = 425 ## Altitude of initial orbit
r2 = 750 ## Altitude of final orbit

## Convert altitudes to radius

r1 = r1 + Re
r2 = r2 + Re

## Calculate initial and final orbital velocities

Vc1 = math.sqrt(mu/r1)
Vc2 = math.sqrt(mu/r2)

## Calculate energy of the transfer

Et = -mu / (r1 + r2)

## Calculate transfer orbit velocities at apoapsis and periapsis

V1 = math.sqrt(2 * ((mu/r1) + Et))
V2 = math.sqrt(2 * ((mu/r2) + Et))

##Calculate deltaV's

dV1 = abs(V1-Vc1);
dV2 = abs(V2-Vc2);

## Calculate semi-major axis

a = (r1 + r2) / 2

## Calculate time of transfer

Tot = math.pi * math.sqrt((a*a*a) / mu)

print dV1
print dV2
print Tot
