function [] = tests_DFT()

  tests = {'DFT_simple_test',...    %%  check for DFT of sin(pi * x) from [0,1)

	   'DFT_do_undo_test',...       %% check that inverse_DFT(DFT(invar)) = DFT(invar)

     'DFT_symmetry_test',...      %%Sample a sin and cos over the same interval, then check that the magnitude of the results are the same.

     'DFT_crosscheck_test',...    %% The result of FFT and DFT should be the same for a given set of data.

     'DFT_by_hand_test',...    %% BY HAND TEST


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




function [] = DFT_simple_test()


    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    inarr = sample_function((@(x) sin(2* pi * x)),[0,1],.125);
    inarr = cartesian2complex(inarr);

    actual = DFT(inarr);
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
           ['Tried: DFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nDFT_simple_test does not output the correct value.'],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end

function [] = DFT_do_undo_test()

    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    inarr = sample_function((@(x) sin(2* pi * x)),[0,1],.125);
    inarr = cartesian2complex(inarr);

    actual = real(IDFT(DFT(inarr)));
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
           ['Tried: DFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nDFT_do_undo_test does not output the correct value.\n'],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end

function [] = DFT_symmetry_test()

    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    inarr = sample_function((@(x) sin(2* pi * x)),[0,1],.125);
    inarr = cartesian2complex(inarr);

    inarr2 = sample_function((@(x) cos(2* pi * x)),[0,1],.125);
    inarr2 = cartesian2complex(inarr2);

    actual = abs(DFT(inarr));
    expect = abs(DFT(inarr2));


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
           ['Tried: DFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nDFT_do_undo_test does not output the correct value.\n '],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end






function [] = DFT_by_hand_test()




    tol = 0;     % There should be no error in a by hand calculation.

    inarr = [0+1i;2+4i;4+3i;6+2i];



    actual = DFT(inarr);
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
           ['Tried: DFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nDFT_by_hand_test does not output the correct value\n '],...
            mat2str(inarr), mat2str(actual), mat2str(expect));
end

function [] = DFT_crosscheck_test()



    tol = 10E-8;     % 10E-8 is a close enough approximation if there is any binary/decimal approximation.

    inarr = sample_function((@(x) sin(2* pi * x)),[0,1],.125);
    inarr = cartesian2complex(inarr);


    actual = DFT(inarr);
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
           ['Tried: DFT(%s)\n', ...
            'Actual: %s \nExpect: %s \nDFT_crosscheck_test does not output the correct value\n IDFT CURRENTLY DOESNT WORK'],...
            mat2str(inarr), mat2str(actual), mat2str(expect));

end

