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
## @deftypefn {Function File} {@var{retval} =} conv_m (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: dimeNA <dimeNA@DIMZ>
## Created: 2014-05-19

function [n, y] = conv_m (nx, x, nh, h)

n = (nx(1)+nh(1)):(nx(end)+nh(end));
y = conv(x, h);
