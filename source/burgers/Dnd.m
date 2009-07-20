function ret = Dnd(uhat,kx,N)
% Function that computes the non linear term for the Burgers
% equation given the spectra of the variable. This version
% performs no dealiasing

%%% ifft
u = ifft(uhat);
dudx = ifft(1i.*kx.*uhat);

%%% nonlinear term and fft
ret = fft(u.*dudx);


