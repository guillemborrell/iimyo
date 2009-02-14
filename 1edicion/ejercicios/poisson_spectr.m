[xx,yy]=meshgrid(linspace(0,2*pi,100),linspace(0,2*pi,100));
%%omega=sin(12*xx).*cos(15*yy);
omega=sqrt((xx-pi).^2+(yy-pi).^2).*exp(-sqrt((xx-pi).^2+(yy-pi).^2)-
				       1./sqrt((xx-pi).^2+(yy-pi).^2)+1);

omega1=poisson(-omega);
figure(1);
surf(omega);
title('dato');
%%figure(2);
%%contour(omega1);
%%title('solucion');
figure(3);
surf(laplacian(omega1));

