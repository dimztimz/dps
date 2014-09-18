
## -*- texinfo -*- 
## @deftypefn {Function File} {@var{[n, x]} =} stepseq (@var{moment}, @var{start}, @var{end})
## Generira signal od vreme @var{start} do vreme @var{end} so edinecen skok vo vreme @var{moment}.
## @seealso{}
## @end deftypefn

## Author: dimeNA <dimeNA@DIMZ>
## Created: 2014-02-22

function [n, x] = stepseq (moment, start, en)
  n = [start:en];
  x = [n >= moment];
