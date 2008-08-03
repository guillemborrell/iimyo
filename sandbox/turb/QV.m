function [ret]=QV(V)
%%
%% Discrete Sinus Transform
%%
%% ret=QV(V)
%%
%%This is a helper function for a Poisson solver using
%%Fast Fourier Transform.  Implements the Qv product along
%%all the columns of the V matrix.

[n,m]=size(V);
V1=[zeros(1,m);V;zeros(n+1,m)];%Builds the array to FFT 
V2=imag(fft(V1)); 
ret=V2(2:n+1,:);    
