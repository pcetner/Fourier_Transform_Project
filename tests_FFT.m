function [] = tests_FFT()







  tests = {'FFT_simple_test',...    %%  check for FFT of sin(pi * x) from [0,1)


     'FFT_symmetry_test',...      %%Sample a sin and cos over the same interval, then check that the magnitude of the results are the same.


     'FFT_crosscheck_test',...   %% Check result against octaves fft() function.


     'FFT_by_hand_test',...    %% BY HAND TEST

     'FFTvsDFT',...    %% FFT should have the same results as DFT


	  };
  for x = tests
    test = x{:};
    try
      feval(test)
    catch lasterror
      fprintf('Failed `%s`\n %s\n \n', test, lasterror.message);
    end
  end
end




function [] = FFT_simple_test()


    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    a = linspace(0,1.75,2^3);
    inarr = i * sin(pi * a);

    actual = FFT(inarr);
    expect = [0+0i;0-4i;0+0i;0+0i;0+0i;0+0i;0+0i;0+4i];


    truth = true;
    if numel(actual) != numel(expect)
      truth = false;
    else
      for x = 1:numel(expect)
        if abs(actual(x)-expect(x)) > tol
          truth = false;
        endif
      endfor
    endif

    assert(truth, ...     % check if it is the right answer
           ['Tried: FFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nFFT_simple_test does not output the correct value'],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end

function [] = FFT_do_undo_test()

    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    inarr = sample_function((@(x) sin(2* pi * x)),[0,1],.125);
    inarr = cartesian2complex(inarr);

    actual = real(IDFT(FFT(inarr)));
    expect = imag(inarr.');


    truth = true;
    if numel(actual) != numel(expect)
      truth = false;
    else
      for x = 1:numel(expect)
        if abs(actual(x)-expect(x)) > tol
          truth = false;
        endif
      endfor
    endif

    assert(truth, ...     % check if it is the right answer
           ['Tried: FFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nFFT_do_undo_test does not output the correct value.\n '],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end

function [] = FFT_symmetry_test()

    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    inarr = sample_function((@(x) sin(2* pi * x)),[0,1],.125);
    inarr = cartesian2complex(inarr);

    inarr2 = sample_function((@(x) cos(2* pi * x)),[0,1],.125);
    inarr2 = cartesian2complex(inarr2);

    actual = abs(FFT(inarr));
    expect = abs(FFT(inarr2));


    truth = true;
    if numel(actual) != numel(expect)
      truth = false;
    else
      for x = 1:numel(expect)
        if abs(actual(x)-expect(x)) > tol
          truth = false;
        endif
      endfor
    endif

    assert(truth, ...     % check if it is the right answer
           ['Tried: FFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nFFT_do_undo_test does not output the correct value.\n'],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end






function [] = FFT_by_hand_test()




    tol = 0;     % There should be no error in a by hand calculation.

    inarr = [0+1i;2+4i;4+3i;6+2i];



    actual = FFT(inarr);
    expect = [10+0i;-2-2i;-2+0i;-2+2i];   ## Calculated by hand


    truth = true;
    if numel(actual) != numel(expect)
      truth = false;
    else
      for x = 1:numel(expect)
        if abs(actual(x)-expect(x)) > tol
          truth = false;
        endif
      endfor
    endif

    assert(truth, ...     % check if it is the right answer
           ['Tried: FFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nFFT_by_hand_test does not output the correct value\n '],...
            mat2str(inarr), mat2str(actual), mat2str(expect));
end

function [] = FFT_crosscheck_test()



    tol = 10E-10;     % 10E-10 is a close enough approximation if there is any binary/decimal approximation.

    inarr = sample_function((@(x) sin(2* pi * x)),[0,1],.125);
    inarr = cartesian2complex(inarr);


    actual = FFT(inarr);
    expect = fft(imag(inarr)).';


    truth = true;
    if numel(actual) != numel(expect)
      truth = false;
    else
      for x = 1:numel(expect)
        if abs(actual(x)-expect(x)) > tol
          truth = false;
        endif
      endfor
    endif

    assert(truth, ...     % check if it is the right answer
           ['Tried: FFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nFFT_crosscheck_test does not output the correct value.\n'],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end

function [] = FFTvsDFT()


    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    a = linspace(0,1.75,2^3);
    inarr = complex(a,sin(pi * a));

    actual = FFT(inarr);
    expect = DFT(inarr);


    truth = true;
    if numel(actual) != numel(expect)
      truth = false;
    else
      for x = 1:numel(expect)
        if abs(actual(x)-expect(x)) > tol
          truth = false;
        endif
      endfor
    endif

    assert(truth, ...     % check if it is the right answer
           ['Tried: FFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nFFT_simple_test does not output the correct value'],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end
