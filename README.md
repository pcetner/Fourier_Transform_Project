# `Fourier Transform Project`

<p align="center">
  <img src="https://github.com/user-attachments/assets/499ac133-434c-4a65-8f2e-562b698d5aa7" alt="A visualization of a signal's frequency components, showing different peaks that represent the strength of specific frequencies over time" />
A visualization of a signal's frequency components, showing different peaks that represent the strength of specific frequencies over time.
</p>


This is a school project on "Signal Analysis and Fourier Transformations" done in Octave, completed during my first semester at Monroe Community College.
The purpose of the project was to code the discrete Fourier transform, its inverse, as well any type of fast Fourier transform.


## Theory

At the core, the Fourier transforms are a way of taking a sampled signal, and using the transform, evaluate it as a summation of various frequency components.
The discrete Fourier transform is the simplest way of doing this, which essentially involves checking how well the strength of a given frequency matches the input signal.
The discrete Fourier transform is defined by the following formula:
```math
 x_k = \sum_{n=0}^{N-1} x_n \cdot e^{-i2pikn/N}
```
Like most transforms, the discrete Fourier transform can be undone by applying the inverse transformation, the inverse discrete Fourier transform.
The inverse discrete Fourier transform is defined by the following formula:
```math
x_n = \frac{1}{N}\sum_{k=0}^{N-1} X_k \cdot e^{i2pikn/N}
```
While the discrete Fourier transform is incredibly beautiful at its core, it has a complexity of O(N²), which makes evaluating large amounts of data extraordinarily slow. 
Fortunately, due to the periodic nature of sinusoids, this complexity can be reduced to O(NlogN) via an implementation of the fast Fourier transform.


Additional elements of the project were graphing:
  - The results of the Discrete Fourier Transform (DFT)
  - The results of the Inverse Discrete Fourier Transform (IDFT)
  - The difference in computation time between the Discrete Fourier Transform (DFT) and the Fast Fourier Transform (FFT)
  - A sliding window evaluation of a given signal


## References

Various references were used throughout this project, listed below.


Discrete Fourier transform:
- https://en.wikipedia.org/wiki/Discrete_Fourier_transform

- A more intuitive video describing the transform:
https://www.youtube.com/watch?v=mkGsMWi_j4Q&ab_channel=SimonXu

Inverse discrete Fourier transform:
- https://en.wikipedia.org/wiki/Discrete_Fourier_transform#Inverse_transform

Fast Fourier transform:
- https://en.wikipedia.org/wiki/Fast_Fourier_transform

- A more intuitive video describing the transform:
https://www.youtube.com/watch?v=nmgFG7PUHfo&ab_channel=Veritasium

