
figure
imshow(ima,[],'InitialMagnification','fit')
hold on
scatter(spb_1(1),spb_1(2))
scatter(spb_2(1),spb_2(2))
x_draw= linspace(-100,100);
for par = -50:2:50
    
    [xx,yy]=coordinatesFromParabollaPars(spb_1,spb_2,par,x_draw);
    
    old_par = convertParabollaFit2OldFit(spb_1,spb_2,par);
    
    plot(xx,yy)
%     scatter(old_par(2),old_par(3))
end