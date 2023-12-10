syms x a
f=[a*x^2, 1/x; log(x), sin(x)];
diff(f, 'x', 2)
