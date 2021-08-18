function [phi, theta, psi] = EulerEKF(z, rates, dt)


persistent H Q R
persistent x P
persistent firstRun

if isempty(firstRun)
    H = [ 1 0 0;
        0 1 0 ];
    
    Q = [ 0.0001 0 0;
        0 0.0001 0;
        0 0 0.1 ];
    
    R = 10*eye(2);
    
    x = [0 0 0]';
    P = 10*eye(3);
    
    firstRun = 1;
end

A = Ajacob(x, rates, dt);

xp = fx(x, rates ,dt);
Pp = A*P*A' + Q;

K = Pp*H'*inv(H*Pp*H' + R);

x = xp + K*(z - H*xp);
P = Pp - K*H*Pp;

phi = x(1);
theta = x(2);
psi = x(3);