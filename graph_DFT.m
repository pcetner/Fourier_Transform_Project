function [] = graph_DFT(ipoints)
  figure(1, 'position',[50,50,1800,1000]);


  outpoints = DFT(ipoints);


  N = numel(outpoints);
  endval=real(ipoints(end));

  subplot(4,1,1)

    title('Input signal');
    xlabel('Time');
    ylabel('Amplitude');
    hold on;
    plot(ipoints,'or-');
    hold off;

  subplot(4,1,2)
    title('Frequency components');
    xlabel('Frequency');
    ylabel('Strength');
    hold on;
    axis([0,N]);
    stem(0:N-1,imag(outpoints));
    hold off;

  subplot(4,1,3)
    title('Phase components');
    xlabel('Frequency');
    ylabel('Phase');
    axis([0,N]);
    hold on;
    stem(0:N-1,angle(outpoints));
    for x = 1:N
      if abs(imag(outpoints(x))) <  1e-8       %% If amplitude at a given k is very close to zero due to binary/decimal conversion
        plot((x-1),0,'xr');                     %% plot red x at(that frequency,0) as the phase of 0+0i is undefined.
      endif                                     %% For example, .0001 - .00002i has a phase, even though it is very close to 0+0i.
    endfor
    hold off;

   subplot(4,1,4)
     title('IDFT');
     xlabel('Time');
     ylabel('Amplitude');
     hold on;
     plot(real(ipoints),IDFT(outpoints),'or-');
     hold off;

end
