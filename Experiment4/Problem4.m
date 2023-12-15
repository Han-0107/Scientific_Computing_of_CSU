clc
clear
format short
y0=[-4.2e+7 300 -5e+6 4000];
tspan=linspace(1,600000,5000);
[t,x]=ode45('orbitfun',tspan,y0);
x1=x(:,1);
vx=x(:,2);
y1=x(:,3);
vy=x(:,4);
plot(x1,y1)
[X,Y,Z]=sphere(30);
Re=0.64e+7;X=Re*X;
Y=Re*Y;
Z=Re*Z;
hold on
surf(X,Y,Z)
s1=0.5*X+x1(200);
s2=0.5*Y+y1(200);
Z=0.5*Z;
surf(s1,s2,Z)
[rmin,i]=min(sqrt(x1.^2+y1.^2));
[rmax,j]=max(sqrt(x1.^2+y1.*2));
a=(rmin+rmax)/2;
c=a-rmin;
b=sqrt(a^2-c^2);
e=c/a;
T=2*abs(t(j)-t(i))/(24*3600);
figure(2)
plot(x1,y1)
hold on
surf(X,Y,Z)
hold on
h=surface(s1,s2,Z);
axis([-0.5,2.4,-1.1,1.1]*10^8)

disp(rmin);
disp(rmax);
fr = sqrt(rmax*rmax-rmin*rmin);
disp(fr);
disp(fr/rmax);
disp(T);

for i=1:50:5000
s1=0.5*X+x1(i);
s2=0.5*Y+y1(i);
set(h,'xdata',s1,'ydata',s2)
drawnow
pause(0.2)
end
