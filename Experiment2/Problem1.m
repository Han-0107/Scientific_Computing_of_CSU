fplot(@(x)(1-exp(-(1-x).^2)).*(x<1)+log(x).*(x>=1),[-40,40])
grid on