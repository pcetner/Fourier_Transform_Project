function [] = sliding_window_graph_FFT_HEATMAP(ipoints,segment_length,segment_shift)
  fprintf("\n\nWARNING! THIS IS A BETA FUNCTION! DEPENDING ON THE INPUTS, CALCULATION TIME CAN EXCEED ONE MINUTE!\n\nADITIONALLY, A STRANGE BUG EXISTS WHERE THE PLOT DOES NOT SCALE TO THE FIGURE SIZE.\nTO FIX, MANUALLY MOVE THE FIGURE WINDOW.\n\n ")
  %%%

  %%%segment_length = 2048
  %%%segment_shift = 32
  %%%a = linspace(0,7,2^13)
  %%%ipoints = i * sin(a.^3)

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
  ALL = [];
  colormap ("default");

  xarr = [];
  yarr = [];
  zarr = [];

  x = 1;

  while x + segment_length < n

    outpoints = FFT(ipoints(x:(x + segment_length) - 1));
    N = numel(outpoints);

    xax= 0:(N-1);
    %%%xlabel('Frequency');

    zax = abs(outpoints);
    %%%zlabel('Strength');

    xarr = [xarr, xax];

    zarr = [zarr, zax];



    x = x + segment_shift;
  endwhile

  heatmap = zarr'(1:rows(zarr'),1:round(max(xax)/22));

  %gate values less than 60 for visual effect.
  heatmap(heatmap < 60) = 0;

  %smooth resulting image
  [X,Y] = meshgrid(1:size(heatmap,2), 1:size(heatmap,1));
  [X2,Y2] = meshgrid(1:0.02:size(heatmap,2), 1:0.02:size(heatmap,1));
  outData = interp2(X, Y, heatmap, X2, Y2, 'linear');

  colormap(jet(64));

  figure(1, 'position',[50,50,1800,1000]);
  imagesc(outData)
  title("Heatmap")
  xlabel("Frequency");
  ylabel("Time");

  colorbar;

  hold off;


end
