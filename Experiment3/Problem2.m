clear;
P1 = [1, 2, 4, 0, 5];
P2 = [1, 2];
P3 = [1, 2, 3];
P1_1 = [0, 0, 0, 0, P1];
P2_1 = [0, 0, 0, 1, 2];
P3_1 = [0, 0, 1, 2, 3];

PX = P1_1 + conv(P2_1, P3_1);
disp("P(X) = ");
disp(num2str(PX));

X = roots(PX);
disp("The roots are ",num2str(X));
disp(X);

A = [-1,1.2,-1.4; 0.75,2,3.5; 0,5,2.5];
for i = 1:size(A, 1)
    for j = 1:size(A, 2)
        p3 = polyval(PX, A(i, j));
        disp(['The polynomial value at A(', num2str(i), ', ', num2str(j), ') is ', num2str(p3)]);
    end
end

p4 = polyvalm(PX, A);
disp("The answer of matrix is ");
disp(num2str(p4));
