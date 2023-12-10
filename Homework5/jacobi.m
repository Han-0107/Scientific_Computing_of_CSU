function [y,n]=jacobi(A,b,x0,ep)
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=D\(L+U);
f=D\b;
y=B*x0+f;
n=1;
while norm(y-x0)>=ep
    x0=y;
    y=B*x0+f;
    n=n+1;
end