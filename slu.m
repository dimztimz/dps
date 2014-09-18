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
## @deftypefn {Function File} {@var{[L, U]} =} slu (@var{A})
## Funkcija za presmetuvanje LU-dekompozicija.
## Raboti samo so kvadratna matrica bez zamena na redovi.
## @seealso{lu.}
## @end deftypefn

## Author: Dimitrij Mijoski <dimeNA@DIMZ>
## Created: 2014-05-16

function [L, U] = slu(A)
[n, n] = size(A); tol = 1.e-6;
for k = 1 : n
  if (abs(A(k, k)) < tol) %ednakvo na nula
    if(abs(A([k+1:n],k)) > tol) % razlicno od nula
      error('Treba zamena na redici, prekinuvam.');
    else
      L(k, k) = 1;
      U(k,k:n) = A(k,k:n);
    end
  else
    L(k, k) = 1;
    L([k+1:n], k) = A([k+1:n], k)/ A(k, k); 
    A([k+1:n],[k+1:n]) -= L([k+1:n],k*ones(1,n-k)) .* A(k*ones(n-k,1),[k+1:n]);
    U(k,k:n) = A(k,k:n);
  end
end
