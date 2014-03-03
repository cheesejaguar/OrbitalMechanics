%%function [result] = Gibbs(R1, R2, R3)

%% Define constants
mu = 398600.4418;

%%Define 3 input vectors

R1 = [ -294.32, 4265.1, 5986.7];
R2 = [ -1365.5, 3637.6, 6346.7];
R3 = [ -2940.3, 2473.7, 6555.8];

%% Calculate vector magnitudes and cross products

r1 = norm(R1);
r2 = norm(R2);
r3 = norm(R3);

c12 = cross(R1,R2);
c23 = cross(R2,R3);
c31 = cross(R3,R1);

%%Calculate D and N vectors

N = r1*c23 + r2*c31 + r3*c12;
D = c12 + c23 + c31;

%% Check for sanity



%% Calcualte P, from pD = N

p = norm(N)/norm(D);

%% Calculate S, then find e using e = S/D

S = R1*(r2 - r3) + R2*(r3 - r1) + R3*(r1 - r2);
e = S/D;

%% Q = w x r, calculate w then find Q

W = N/norm(N);
Q = S/norm(S);

%% Calculate B and L

B = cross(D,R2);
L = sqrt(mu/(norm(D) * norm(N)));

%% Calculate V2
v2 = (norm(L)/r2)*B + norm(L) * S;

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

a = p / (1-e^2);

result(1) = e;
result(2) = Omega;
result(3) = inclination;
result(4) = omega;
result(5) = nu;
result(6) = a;

%% Plot 3 vectors, and orbit

figure;

%% 3 Vectors
plotv(R1,'-');
plotv(R2,'-');
plotv(R3,'-');
%% Orbit???


%%end

