# `graph_DFT`
Given an array of complex coordinates, a DFT transformation can be applied to represent the data as a sumation of different frequencies of varying magnitudes and phases.

## Syntax
```matlab
[] = graph_DFT(ipoints)
```

## Description
Given the input array of `ipoints` with a size of `N`, various graphs can be constructed, such as:

The origonal signal(Amplitude vs Time)
The frequncy components(Strength vs Frequency)
The phase components(Phase vs Frequency) (NOTE: a red 'x' represents that the strength of a frequency is near zero.)
The IDFT(Amplitude vs Time)


`ipoints` should be composed of points in the complex plane.

Note that there may be a very tiny amount of error for each value due to binary/decimal conversion.

## Examples

For a demonstration, run demo_graph_DFT.m 

## Theory

The DFT is defined by the following formula:
```math
 x_k = \sum_{n=0}^{N-1} x_n \cdot e^{-i2pikn/N}
```

For reference, see:

https://en.wikipedia.org/wiki/Discrete_Fourier_transform


The IDFT is defined by the following formula:
```math
x_n = \frac{1}{N}\sum_{k=0}^{N-1} X_k \cdot e^{i2pikn/N}
```


For reference, see:

https://en.wikipedia.org/wiki/Discrete_Fourier_transform#Inverse_transform




