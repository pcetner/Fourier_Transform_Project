# `DFT`
Given an array of complex coordinates, a DFT transformation can be applied to represent the data as a sumation of different frequencies of varying magnitudes and phases.

## Syntax
```matlab
[outpoints] = DFT(ipoints)
```

## Description
Given the input array of `ipoints` with a size of `N`, the result `outpoints` is an `N` x 1 array of complex numbers.

`ipoints` should be composed of points in the complex plane. Only the imaginary component is used by the function.

Note that there may be a very tiny amount of error for each value due to binary/decimal conversion.

## Examples
```matlab
>>%%Below is sin(2 * pi * x) sampled by .125 eight times, starting at 0 and ending at 0.875 . 
>> DFT([0+0i;0.125+0.707i;0.25+1i;0.375+0.707i;0.5+0i;0.625-0.707i;0.75-1i;0.875-0.707i])  
ans =

  -0.0000 +      0i
   0.0000 - 3.9997i
  -0.0000 + 0.0000i
        0 + 0.0003i
        0 + 0.0000i
   0.0000 - 0.0003i
   0.0000 + 0.0000i
  -0.0000 + 3.9997i
  
  
>>%% Below is cos(2 * pi * x) sampled by .125 eight times, starting at 0 and ending at 0.875 .
>> DFT([0+1i;0.12500+.7071i;0.2500+0.0000i;0.3750-0.7071i;0.5000-1.0000i;0.6250-0.7071i;0.7500-0.0000i;0.8750+0.7071i]) 
ans = 

  -0.0000 +      0i
   4.0000 - 0.0000i
  -0.0000 - 0.0000i
   0.0000 - 0.0000i
   0.0000 - 0.0000i
   0.0000 - 0.0000i
   0.0000 - 0.0000i
   4.0000 + 0.0000i


```
## Theory

The DFT is defined by the following formula:
```math
 x_k = \sum_{n=0}^{N-1} x_n \cdot e^{-i2pikn/N}
```


For reference, see:

https://en.wikipedia.org/wiki/Discrete_Fourier_transform

A more intuitive video describing the transform:
https://www.youtube.com/watch?v=mkGsMWi_j4Q&ab_channel=SimonXu


