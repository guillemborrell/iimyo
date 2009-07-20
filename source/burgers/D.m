function ret = D(uhat,kx,N)
% Function that computes the non linear term for the Burgers
% equation given the spectra of the variable. The dealias cuts
% half the spectra.
dealias = [ones(1,N/4+1),zeros(1,N/2-1),ones(1,N/4)];
uhat = uhat.*dealias;

%%% ifft
u = ifft(uhat);
dudx = ifft(1i.*kx.*uhat);

%%% nonlinear term and fft
ret = fft(u.*dudx);


