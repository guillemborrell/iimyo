function [Ajm1,Aj,Ajp1] = block(M,j,dx,dy)

% Function that builds the blocks needed for the Linan problem
% Input arguments:
% M: size of the square block
% j: index of the block
% dx: x spacing
% dy: y spacing
% Output arguments:
% Ajm1, Aj, Ajp1: Blocks

eta = @(j) 2*dy*(j-1);
Ajm1 = diag([0,(-1/dy^2)*ones(1,M-2),0],0);
Ajp1 = diag([0,(-1/dy^2)*ones(1,M-2),0],0);
Aj = diag([1,(2/dx^2+2/dy^2)*ones(1,M-2),1],0)+...
     diag([0,(eta(j)/2/dx-1/dx^2)*ones(1,M-2)],1)+...
     diag([-(eta(j)/2/dx+1/dx^2)*ones(1,M-2),-1],-1);
