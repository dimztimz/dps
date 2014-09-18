## Copyright (C) 2014 dimeNA
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} ovrlpsav (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: dimeNA <dimeNA@DIMZ>
## Created: 2014-06-30

function [y, blokovi] = ovrlpsav(x,h,N)
% Overlap-Save method of block convolution
% ----------------------------------------
% [y] = ovrlpsav(x,h,N)
% y = output sequence
% x = input sequence
% h = impulse response
% N = block length
% 
Lenx = length(x); M = length(h); M1 = M-1; L = N-M1;
h=[h zeros(1,N-M)];
%
x = [zeros(1,M1), x, zeros(1,N-1)]; % preappend (M-1) zeros
K = floor((Lenx+M1-1)/(L)); % # of blocks
Y = zeros(K+1,N);
% convolution with succesive blocks
for k=0:K
  xk = x(k*L+1:k*L+N);
  Y(k+1,:) = circonvt(xk,h,N);
end
blokovi = Y;
Y = Y(:,M:N)';
% discard the first (M-1) samples
y=(Y(:))';
% assemble output
