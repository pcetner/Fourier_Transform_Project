function [] = sliding_window_graph_FFT(ipoints,segment_length,segment_shift)
  %%slices needs to be a power of 2 so...
    q = segment_length;
    A = q;
    x = 2;
    while x <= q
      if x * 2 > q
        break;
      endif
      x = x * 2;
    endwhile
    if x != q
      if q != 1
        fprintf("Warning, segment_length is not a power of two, which will cause inacuracy in results.\n numel(segment_length)= %d\n", A);
        return
      endif
    endif
  %%




  ipoints = truncate2pow2(ipoints);
  %% The above code truncates the input to a power of two if neccesary.

  n = numel(ipoints);
  dx   = real(ipoints(2)) - real(ipoints(1));


  x = 1;
  figure(1, 'position',[50,50,1800,1000]);
  while x + segment_length < n

    outpoints = FFT(ipoints(x:(x + segment_length) - 1));
    N = numel(outpoints);

    xax = (0:N-1);
    xlabel('Frequency');

    yax = (x * ones(1,N));
    ylabel('Time');

    zax = abs(outpoints);
    zlabel('Strength');

    axis([min(xax),max(xax)/22]);

    plot3 (xax, yax ,zax);
    pause(.10)
    hold on;
    x = x + segment_shift;
  endwhile
end
