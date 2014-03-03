function [TP, e, Omega, inclination, omega, nu, a] = OrbitDet(R2, V2)

%%R2 = [4400, 2500, 0]
%%v2 = [-9000, 15000, 18000] / 6076.12

mu = 62750.159;


%% Using R2 and v2, calculate orbital elements

H = cross(R2,v2);

%%Calculate i (inclination)
inclination = acos(H(3)/norm(H));
inclination = inclination * 180/pi;

n = [-H(2), H(1), 0];

v=norm(v2);
r=norm(R2);

vr   = dot(R2,v2)/r;

E = 1/mu*((v^2 - mu/r)*R2 - dot(R2,v2)*v2);

%%Calculate Omega (longitude of the ascending node)

Omega = acos(n(1)/norm(n)) * 180/pi;

%%Calculate omega (argument of periapsis)

omega = acos(dot(n,E)/(norm(n) * norm(E))) * 180/pi;

%%Calculate nu (mean anomaly)

nu = acos(dot(E,R2)/(norm(E) * norm(R2))) * 180/pi;

%%Calculate eccentricity
e = norm(E);

%% Calculate orbital major axis

p = norm(H)^2/mu;
a = p / (1-e^2);

%% Calculate orbital period

TP = 2*pi/sqrt(mu) * a^(3/2);

%%result(1) = e
%%result(2) = Omega
%%result(3) = inclination
%%result(4) = omega
%%result(5) = nu
%%result(6) = a

end