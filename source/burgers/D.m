function ret = D(uhat,kx,N)
% Function that computes the non linear term for the Burgers
% equation given the spectra of the variable. The dealias cuts
% half the spectra.

uhat = [uhat(1:N/4),zeros(1,N/2),uhat(3*N/4+1:end)];
plot(abs(fftshift(uhat)));
%%% ifft
u = ifft(uhat);
dudx = ifft(1i.*kx.*uhat);

%%% nonlinear term and fft
ret = fft(u.*dudx);


