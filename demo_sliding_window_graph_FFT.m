function [] = demo_sliding_window_graph_FFT()

  a = linspace(0,7,2^12);
  ipoints = i * sin(a.^3);

  segment_length = 512;
  segment_shift = 64;

  figure(2, 'position',[1800,1100,800,400])
  plot(a, imag(ipoints));
  title("Origonal Signal");
  xlabel("Time");
  ylabel("Amplitude");

  sliding_window_graph_FFT(ipoints,segment_length,segment_shift)


end
