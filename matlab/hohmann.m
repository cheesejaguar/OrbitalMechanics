function [dV1, dV2] = hohmann(r1, r2)

%% Define constants
mu = 398600.4418;
Re = 6378.1;

%% Input Parameters

r1 = r1 + Re;
r2 = r2 + Re;

%% Calculate initial and final velocities

Vc1 = sqrt(mu/r1);
Vc2 = sqrt(mu/r2);

%% Calculate energy of the transfer

Et = -mu / (r1 + r2);

%% Calculate transfer orbit velocities at periapsis and apoapsis

V1 = sqrt(2 * ((mu/r1) + Et));
V2 = sqrt(2 * ((mu/r2) + Et));

%%Calculate deltaV's

dV1 = abs(V1-Vc1);
dV2 = abs(V2-Vc2);

end