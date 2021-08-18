function [z1, z2] = GetPos()

persistent Velp Posp

if isempty(Posp)
    Posp = 0;
    Velp = 80;
end

dt = 0.1;

w = 0 + 10*randn;
v = 0 + 10*randn;

z1 = Posp + Velp*dt + v;

Posp = z1 - v; % True position
Velp = 80 + w; % True speed

z2 = Velp;