function [] = graph_DFT_vs_input(in)
## Plot the points "in" plus the results of DFT(in) in seperate plots
  subplot(2,1,1);
  plot(in(:,1),in(:,2));
  axis([min(in(:,1)) max(in(:,1)) min(in(:,2)) max(in(:,2))]);

  subplot(2,1,2);
  ans = DFT(in);
  plot(ans(:,1),ans(:,2));  %%ans(:,3) represents phase.
  axis([min(ans(:,1)) max(ans(:,1)) min(ans(:,2)) max(ans(:,2))]);
end
