% Copyright (C) 1992-1994 Richard Shrager
% Copyright (C) 1992-1994 Arthur Jutan
% Copyright (C) 1992-1994 Ray Muzic
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; If not, see <http://www.gnu.org/licenses/>.

% leasqrdemo
%
% An example showing how to use non-linear least squares to fit 
% simulated data to the function:
%
%      y = a e^{-bx}

% 2001-02-05 Paul Kienzle
%   * collected example into a single script

function fit
  % generate test data
  t = load('x.dat');
  data = load('y.dat');
  sorted = sortrows([t,data],1);

  t=sorted(:,1);
  data=sorted(:,2);

  wt1 = (1 + 0 * t) ./ sqrt (data); 

  % Note by Thomas Walter <walter@pctc.chemie.uni-erlangen.de>:
  %
  % Using a step size of 1 to calculate the derivative is WRONG !!!!
  % See numerical mathbooks why.
  % A derivative calculated from central differences need: s 
  %     step = 0.001...1.0e-8
  % And onesided derivative needs:
  %     step = 1.0e-5...1.0e-8 and may be still wrong

  F = @leasqrfunc;
  dFdp = @leasqrdfdp; % exact derivative
  % dFdp = @dfdp;     % estimated derivative
  dp = [0.001; 0.001];
  pin = [0.5; 0.5]; 
  stol=0.001; niter=100;
  minstep = [0.01; 0.01];
  maxstep = [0.8; 0.8];
  options = [minstep, maxstep];

  global verbose;
  verbose=1;
  [f1, p1, kvg1, iter1, corp1, covp1, covr1, stdresid1, Z1, r21] = ...
    leasqr (t, data, pin, F, stol, niter, wt1, dp, dFdp, options);
