% All the parabollas that pass by two points x0 and x1:

x0 = 40;
x1 = -40;

figure
hold on
scatter(x0,0)
scatter(x1,0)
x = linspace(-50,50);
for b = -80:80
    a = -b/x0.^2;
    plot(x,a*x.^2+b)
end