function [out] = sample_function(f, domain, dx)
%% This function is not used anywhere, it can be ignored.
%% This was the very first function made for the project, it holds too much sentimental value to remove...


## Takes in function handle f and a domain array [low,high] and a step size of dx
## Returns the coordinates of the sampled points between low:dx:high(not including high)
  index = domain(1);
  out(1,1) = index;
  out(1,2) = f(index);
  index = index + dx;
  while index < domain(2)
    out = cat(1,out,[index,f(index)]);
    index = index + dx;
  endwhile
end
