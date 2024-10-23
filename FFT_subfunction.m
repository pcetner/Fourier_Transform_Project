function [outpoints] = FFT_subfunction(ipoints)
  N = numel(ipoints);


  if N==1
    outpoints = ipoints;
    return;
  endif

  M = N/2;
  pos = 0;

  while pos < M
    xEVEN(pos+1) = ipoints((2 * (pos))+1);
    xODD (pos+1) = ipoints((2 * (pos))+2);
    pos = pos + 1;
  endwhile

  fEVEN = FFT_subfunction(xEVEN);
  fODD = FFT_subfunction(xODD);

  x = 0;

  while x < M
    complex = fODD(x + 1) * (e ^ (-2 * i * pi * x / N ));
    outpoints(x + 1) = fEVEN(x + 1) + complex;
    outpoints(x + 1 + (N/2))= fEVEN(x + 1) - complex;
    x = x + 1;
  endwhile

end
