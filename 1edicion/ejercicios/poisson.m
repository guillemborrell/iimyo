function X=poisson(B)
  %%
  %% ret = poisson(B)
  %%
  %% Solve the discrete Poisson equation on an n-by-n grid
  %% with right hand side B

  [n,m]=size(B);
  %% Form eigenvalues of matrix 
  L=2*(1-cos((1:n)*pi/(n+1))); 

  %% Form reciprocal sums of eigenvalues
  %% Include scale factor 2/(n+1) (We want Q, but F!)

  LL=(2/(n+1))*ones(n,n)./(L'*ones(1,n)+ones(n,1)*L);

  %% Solve, using QV
  X = QV(B');
  X = QV(X');
  X = LL.*X;
  X = QV(X');
  X = QV(X');
