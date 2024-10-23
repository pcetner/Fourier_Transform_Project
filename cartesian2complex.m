## This is a conversion function that takes in an array of cartesian cordinates such as:
##  in = [1,1;2,4;3,6]
## and returns a "converted" array of cartesian cordinates
##  out = [1+1i,2+4i,3+6i]

function [out] = cartesian2complex(in)
  out = zeros(1,rows(in));
  for x = 1:numel(out)
    out(x) = complex(in(x,1),in(x,2));
  endfor
end
