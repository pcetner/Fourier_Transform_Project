function [] = demo_limiting_DFT()
        ##LIMITING VISUAL TEST BELOW, which passes.
        %% TAKE SIN (2 * PI * T) from [0,4], and adjust sampling rate.
        %% The strength of the fundemental frequency increases as sampling rate increases.

      samplerate = 2.^[1:6];
      for x = 1:numel(samplerate)
          clf;

          inarr = sample_function((@(x) sin(2* pi * x)),[0,4],1/samplerate(x));
          inarr = cartesian2complex(inarr);
          graph_DFT(inarr);

          pause(1);

     endfor

end
