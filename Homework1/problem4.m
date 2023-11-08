f=zeros(1,20);
f(1)=1;
f(2)=0;
f(3)=1;
for i=4:1:20
    f(i)=f(i-1)-2*f(i-2)+f(i-3);
end
f4(f);