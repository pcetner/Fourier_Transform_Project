## This is a conversion function that takes in an array of complex numbers such as:
##  in = [1+1i,2+4i,3+6i]
## and returns a "converted" array of cartesian cordinates
##  out = [1,1;2,4;3,6]

function [out] = complex2cartesian(in)
  out = zeros(numel(in),2);
  for x = 1:numel(in)
    out(x,1) = real(in(x));
    out(x,2) = imag(in(x));
  endfor
end
