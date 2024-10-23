function [out] = IDFT(in)
  N = length(in);
  out = zeros(N,1);
  for n = 1:N
        for k = 1:N
          out(n) = out(n) + ((in(k)) * exp((i * 2 * pi * (k-1) * (n-1)) / N));
        endfor
        out(n) = out(n)/N;
  endfor
end
