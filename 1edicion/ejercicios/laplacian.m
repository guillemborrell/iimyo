function ret=laplacian(field)
%%
%% finds the laplacian of a 2D scalar field
%%
%%

[dx,dy] = gradient(field);
[dxx,dxy] = gradient(dx);
[dxy,dyy] = gradient(dy);

ret = dxx+dyy;
