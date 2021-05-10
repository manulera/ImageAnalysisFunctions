

[xx,yy,zz] = coordinatesAndValuesInMask(mask & ~isnan(ima),ima);

centering_point = (spb_1+spb_2)/2;
angle=angle2Points(spb_1,spb_2);
[xx,yy]=centerThenRotate(xx,yy,centering_point(1),centering_point(2),angle);


settings.decay_length = 5;
settings.weight_center=0.001;
fun = @(pars) weightFunctionConstrainedIntensity(xx,yy,zz-bg,pars,settings);

opts = optimset('MaxFunEvals',5000, 'MaxIter',1000);
pars = fminsearch(fun, [1,10], opts);

figure
imshow(ima,[])
hold on
x = linspace(-100,100);
y = pars(1)*x.^2 + pars(2);

[xx,yy]=rotateThenShift(x,y,centering_point(1),centering_point(2),-angle);
scatter(centering_point(1),centering_point(2))

norm_vector = (spb_2-spb_1)/norm(spb_2-spb_1);
ortho_vector = norm_vector([2,1]) .* [1,-1];
new_centering = centering_point - ortho_vector*pars(2);
scatter(centering_point(1),centering_point(2))
scatter(new_centering(1),new_centering(2))
plot(xx,yy)
