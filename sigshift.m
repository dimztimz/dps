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
## @deftypefn {Function File} {@var{[y,n]} =} sigshift (@var{n1}, @var{x1}, @var{k})
## implements y(n) = x(n-k)
## @seealso{}
## @end deftypefn

## Author: dimeNA <dimeNA@DIMZ>
## Created: 2014-05-18

function [n, y] = sigshift (n1, x1, k)

n = n1+k; y = x1;