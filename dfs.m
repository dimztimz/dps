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
## @deftypefn {Function File} {@var{Xk} =} dfs (@var{xn}, @var{N})
## Presmetuva diskretna furieva serie na periodicna niza
## @var{xn} - prv period od periodicna niza, pocnuva od vremeneski moment 0
## @var{N} - broj na primeroci od 0 do 2pi voedno i dolzina na perioda
## @seealso{}
## @end deftypefn

## Author: dimeNA <dimeNA@DIMZ>
## Created: 2014-06-29

function [Xk] = dfs (xn, N)

n = [0:N-1];
k = [0:N-1];
Xk = xn * exp(-i*2*pi/N * (n'*k));

