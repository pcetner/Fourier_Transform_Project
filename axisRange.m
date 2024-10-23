function [lohi] = axisRange(A,p)
  minval = A(1);
  maxval = A(1);
  for x = 1:numel(A)
    if A(x) < minval
      minval = A(x);
    endif
    if A(x) > maxval
      maxval = A(x);
    endif
  endfor
  difer = maxval - minval;
  lohi = [minval - (p * difer), maxval + (p * difer)];
end
