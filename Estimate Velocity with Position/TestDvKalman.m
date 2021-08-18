% Estimate velocity from pose data
clear all

dt = 0.1;
t = 0:dt:10;

Nsamples = length(t);

Xsaved = zeros(Nsamples, 2);
Zsaved = zeros(Nsamples, 1);

for k = 1:Nsamples
    [z1, z2] = GetPos();
    [pos vel] = DvKalman(z1);
    
    Xsaved(k, :) = [pos vel];
    Z1saved(k) = z1;
    Z2saved(k) = z2;
end

figure
hold on
plot(t, Z1saved, 'r.')
plot(t, Xsaved(:, 1))

figure
hold on
plot(t, Xsaved(:, 2))
plot(t, Z2saved, ':')