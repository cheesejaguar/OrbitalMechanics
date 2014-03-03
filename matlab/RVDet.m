function [R, V] = RVDet(a, e, nu)

%% Calculate R and V given orbital elements

mu = 398600.4418;

%{
a = 23550;
e = 0.625;
inclination = 38 * pi/180;
Omega = 25 * pi/180;
omega = 0;
nu = 0;
%}

%%Calculate p from a and e
p = a * (1 - e^2);

%%Calculate scalar value of r
r = p / (1+e*cos(nu));


%%Calculate R vector using equation 2.5-1
R = r*cos(nu)*[1,0,0] + r*sin(nu)*[0,1,0]

%%Calculate V using equation 2.5-4

V = sqrt(mu/p) * ( -sin(nu) * [1,0,0] + (e + cos(nu)) * [0,1,0])

end