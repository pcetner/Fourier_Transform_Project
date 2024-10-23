function [outpoints] = FFT(ipoints)
  ipoints = truncate2pow2(ipoints);
  ipoints = imag(ipoints);

  %% The above code truncates the input to a power of two if neccesary.

  outpoints = FFT_subfunction(ipoints).';

end
