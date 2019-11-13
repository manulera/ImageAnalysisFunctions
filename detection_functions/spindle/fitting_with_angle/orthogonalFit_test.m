%% Make noisy data for a polynomium and rotate it

x = linspace(-1,1,200);
a = 2;
b = 1;
y = a*x.^2+b*x;

noise = (rand(size(x))-0.5);
y = y+noise;
% Rotation matrix
theta = 0.6;
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
coords = [x' y'] * R;
x = coords(:,1);
y = coords(:,2);

% Draw
figure
axis equal
scatter(x,y)
hold on

%% Fit 
% It is quite sensitive to initial parameters
pars = orthogonalFit(x,y,[0.1,mean(x),mean(y),1],1,'robust');

x = linspace(-1.5,1.5,200);
y = pars(4)*x.^2;

% Rotation matrix
theta = -pars(1);
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
coords = [x' y'] * R;
x = coords(:,1);
y = coords(:,2);

% % Center at the point x0,y0
x = x+pars(2);
y = y+pars(3);

% Draw
plot(x,y,'Linewidth',2)




