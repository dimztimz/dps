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
## @deftypefn {Function File} {@var{retval} =} evenodd (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: dimeNA <dimeNA@DIMZ>
## Created: 2014-05-18

function [n, xeven, xodd] = evenodd (n1, x)
if any(imag(x) ~= 0)
  error('Signalot sodrzi kompleken broj');
end
n2 = -n1(end:-1:1);
n = min([n1, n2]):max([n1, n2]);
startIdx = n1(1) - n(1);
n1Idx = 1:length(n1);
y = zeros(1, length(n));
y(n1Idx+startIdx) = x;

xeven = 1/2*(y + y(end:-1:1));
xodd = 1/2*(y - y(end:-1:1));