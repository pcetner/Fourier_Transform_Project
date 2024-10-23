function [] = Demo_calculation_time_DFT_FFT()
  fprintf("This calculation may take a few seconds, please be patient...\n")
  a = linspace(0,7,2^8);
  ipoints = sin(a);
  n = numel(ipoints);
  DFTtime = 0;
  FFTtime = 0;
  xpos = 0;

  x = 4;


  while x < n
      tic
      for y = 1:10
        DFT(a(1:x));
      endfor
      DFTtime(end+1) = toc;


      tic
      for y = 1:10
        FFT(a(1:x));
      endfor
      FFTtime(end+1) = toc;

      xpos(end+1) = x;

      x = x*2;
  endwhile

  %% The above loop records the time it takes to run the DFT and FFT five times each over an increasing number of samples.
  %% x and y can be increased, but the calculation will take far longer to run.

  hold on;
  plot(xpos,DFTtime,'-or');
  plot(xpos,FFTtime,'-ob');

  title("Computation time of FFT and DFT for varying sample size");
  legend ("DFT", "FFT");
  xlabel("Number of samples");
  ylabel("Time");
end
