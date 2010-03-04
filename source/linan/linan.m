function [A,b] = linan (Lx1,Lx2,Ly,M,N)
%% Matrix for Linan problem.
%% No clustering, finite differences 2nd order
%% Boundary conditions 1st order

%% Allocate the matrix
A = zeros(M*N);

%% Data
Lx = Lx1+Lx2;
dx = (Lx1+Lx2)/M;
dy = Ly/N;
M1 = int32(M*Lx1/Lx);

A(1:M,1:M) = diag(-1*ones(1,M));
A(1:M,M+1:2*M) = diag(ones(1,M));
A(M*(N-1)+1:M*N,M*(N-1)+1:M*N) = diag(ones(1,M));

for j=2:N-1
  [Ajm1,Aj,Ajp1] = block(M,j,dx,dy);
  A(M*(j-1)+1:M*j,M*(j-1)+1:M*j) = Aj;
  A(M*(j-1)+1:M*j,M*(j-2)+1:M*(j-1)) = Ajm1;
  A(M*(j-1)+1:M*j,M*j+1:M*(j+1)) = Ajp1;
end

b = zeros(M*N,1);
b(M1:M) = -dy; 
