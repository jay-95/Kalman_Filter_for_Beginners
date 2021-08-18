clear all

dt = 0.2;
t = 0:dt:10;

Nsamples = length(t);

Xsaved = zeros(Nsamples, 3);
Zsaved = zeros(Nsamples, 1);

for k = 1:Nsamples
    z = GetVolt();
    [volt, Cov, Kg] = SimpleKalman2(z);
    
    Xsaved(k, :) = [volt, Cov, Kg];
    Zsaved(k) = z;
end

figure
plot(t, Xsaved(:, 1), 'O-')
hold on
plot(t, Zsaved, 'r:*')
xlabel('Time [sec]')
ylabel('Voltage [V]')
legend('Kalman Fileter', 'Measurement')

figure
plot(t, Xsaved(:, 2), 'O-')
xlabel('Time [sec]')
ylabel('P')

figure
plot(t, Xsaved(:, 3), 'O-')
xlabel('Time [sec]')
ylabel('K')