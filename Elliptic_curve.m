%---Rounak Hitendra Nayee
%---K.J.Somaiya College Of Engineering
% Elliptic Curve Cryptography
% MATLAB CODE

clc;
clear all;
close all;

a = input('Enter a: ');
b = input('Enter b: ');
p = input('Enter prime p: ');
x = pointsoncurve(a,b,p);
disp('Points on curve : ');
disp(x);
disp('Pick P and Q from the obtained points');
P = input('Enter  point P: ');
Q = input('Enter point Q: ');
R = pointAdd(P,Q,a,b,p);
disp('Value of new point R: ');
disp(R);

function points = pointsoncurve(a,b,p)
    points = [];
    for x=0:1:p-1
        disp(x);
        y_sq = mod(x^3 + a*x + b,p);
        q_r = exponentmod(y_sq,(p-1)/2,p);
        if q_r == 1
        e = (p+1)/4;
        y_root1 = exponentmod(+y_sq,e,p);
        y_root2 = exponentmod(-y_sq,e,p);
        points = vertcat(points,[x,y_root1]);
        points = vertcat(points,[x,y_root2]);
        end        
    end
end

function R = pointAdd(P,Q,a,b,p)
    x1 = P(1);
    y1 = P(2);
    x2 = Q(1);
    y2 = Q(2);
    if P==Q
        s = mod((mod(3*(x1^2)+a,p) * exponentmod(2*y1,p-1-1,p)),p);
        disp(s);
    else
        s = mod((mod(y2-y1,p) * exponentmod(x2-x1,p-1-1,p)),p);
        disp(s);
    end
    x3 = mod((s^2)-x1-x2,p);
    y3 = mod((s*(x1-x3))-y1,p);
    R = [x3 y3];
end

function a=exponentmod(b,e,m)
if m==1
    a=0;
    return
end
i=1;
a=1;
while i<=e
    a = mod(a*b,m);
    i = i+1;
end
end
