function [] = demo_graph_DFT()
  ipoints = sample_function((@(x) sin(2* pi * x)),[0,2],.125);
  ipoints = cartesian2complex(ipoints);
  graph_DFT(ipoints);
end
