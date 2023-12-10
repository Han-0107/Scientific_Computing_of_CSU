doty=@(t,y)[2*sin(t)-2*y(1)-y(2);y(1)];
[t,y]=ode45(doty,[0,30],[-1,1]);
plot(t,y(:,2))
xlabel('t');
ylabel('y');
hold on
t=1:0.1:30;
y=dsolve('D2y+2*Dy+y-2*sin (t)','y(0)=1','Dy(0)=-1','t')
plot(t,2*exp(-t)-cos(t)+t.*exp(-t))
legend('ode45方法', 'dsolve方法')