f=@(x) x.^2./(exp(x)+1);
[I1,n]=quad(f,0,2);
disp('Simpson方法结果：');
vpa(I1,6)
