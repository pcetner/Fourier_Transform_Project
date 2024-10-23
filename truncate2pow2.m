function [outpoints] = truncate2pow2(ipoints)
%% This is a utility function that checks the number of elements provided in the input is a power of two.
%% If the number of elements is not a power of 2, then the input gets truncated to the nearest power of 2, and a warning gets printed.
%% If the number of elements is a power of 2, then the input is unchanged.

%% This function doesnt have a set of tests for it, as it is such a trivial function. A handful of test cases were manually checked to verify it
%% works as expected.


  N = numel(ipoints);
  A = N;
  x = 2;
  while x <= N
    if x * 2 > N
      break;
    endif
    x = x * 2;
  endwhile
  if x != N
    if N != 1
      fprintf("Warning, input does not have 2^x values and will be truncated.\n New matrix size: %d\n Origonal size: %d\n", x, A);
      outpoints = ipoints(1:x);
      return
    endif
  endif
  outpoints = ipoints;


end
