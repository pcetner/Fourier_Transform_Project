function [outpoints] = DFT(ipoints)

  N = length(ipoints);
  outpoints = zeros(N,1);


  for k = 1:N
        for n = 1:N
          outpoints(k) = outpoints(k) + (imag(ipoints(n)) * exp(i * -2 * pi * (k-1) * (n-1) / N));
        endfor
  endfor
end
