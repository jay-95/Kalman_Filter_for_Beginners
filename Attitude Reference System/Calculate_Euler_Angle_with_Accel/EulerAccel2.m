function [phi, theta] = EulerAccel2(ax, ay, az)


g = 9.8;

phi = atan(ay/az);
theta = atan(-ax/sqrt(ay^2 + az^2));