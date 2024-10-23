# `IDFT`
Given an array of complex coordinates, a DFT transformation can be applied to represent the data as a sumation of different frequencies of varying magnitudes and phases. 
The inverse DFT takes the output of the transform, and returns the values of the inputs.


## Syntax
```matlab
[outpoints] = IDFT(ipoints)
```

## Description
Given the input array of `ipoints` with a size of `N` complex numbers, the result `outpoints` is an `N` x 1 array of complex numbers.

The real component of `outpoints` represents the amplitude at a given time of the origonal function. The imaginary component does not represent anything.

Note that there may be a very tiny amount of error for each value due to binary/decimal conversion.

## Examples
```matlab
>>%%Below is sin(2 * pi * x) sampled by .125 eight times, starting at 0 and ending at 0.875 . 
>> a = DFT([0+0i;0.125+0.707i;0.25+1i;0.375+0.707i;0.5+0i;0.625-0.707i;0.75-1i;0.875-0.707i])  
a =

  -0.0000 +      0i
   0.0000 - 3.9997i
  -0.0000 + 0.0000i
        0 + 0.0003i
        0 + 0.0000i
   0.0000 - 0.0003i
   0.0000 + 0.0000i
  -0.0000 + 3.9997i

>> IDFT(a)  	
ans =

   1.3674e-16 + 1.1102e-16i
   7.0700e-01 - 3.8858e-16i
   1.0000e+00 + 2.6615e-16i
   7.0700e-01 + 7.7716e-16i
   4.6950e-17 + 2.2204e-16i
  -7.0700e-01 + 3.8858e-16i
  -1.0000e+00 - 8.6345e-16i
  -7.0700e-01 + 1.4988e-15i
  
>>%% Below is cos(2 * pi * x) sampled by .125 eight times, starting at 0 and ending at 0.875 .
>> b = DFT([0+1i;0.12500+.7071i;0.2500+0.0000i;0.3750-0.7071i;0.5000-1.0000i;0.6250-0.7071i;0.7500-0.0000i;0.8750+0.7071i]) 
b = 

  -0.0000 +      0i
   4.0000 - 0.0000i
  -0.0000 - 0.0000i
   0.0000 - 0.0000i
   0.0000 - 0.0000i
   0.0000 - 0.0000i
   0.0000 - 0.0000i
   4.0000 + 0.0000i
   
>> IDFT(b)  	
ans =

   1.0000 + 0.0000i
   0.7071 + 0.0000i
   0.0000 + 0.0000i
  -0.7071 - 0.0000i
  -1.0000 - 0.0000i
  -0.7071 + 0.0000i
  -0.0000 +      0i
   0.7071 - 0.0000i

```
## Theory

The IDFT is defined by the following formula:
```math
x_n = \frac{1}{N}\sum_{k=0}^{N-1} X_k \cdot e^{i2pikn/N}
```


For reference, see:

https://en.wikipedia.org/wiki/Discrete_Fourier_transform#Inverse_transform


