# `sliding_window_graph_FFT`
Given an array of amplitudes of a signal at preset sample rate, a window size(segment_length), and a window shift(segment_shift), a sliding window 3d graph can be created.

## Syntax
```matlab
[] = sliding_window_graph_FFT(ipoints,segment_length,segment_shift)
```

## Description
Given an array of amplitudes of a signal at preset sample rate(`ipoints`), a window size(`segment_length`), and a window shift(`segment_shift`), a sliding window 3d graph can be created.

`ipoints` should be composed of points in the complex plane. 
## Examples

For a demonstration, run demo_sliding_widow_graph_FFT.m

## Theory

The graph has three axies; time, frequency, and strength. The animation graphs the FFT of ipoints from 0 to `segment_length`, then repeats that, shifting the window it looks at by `segment_shift`.
In other words, the windows that get evaluated are:
	1,`segment_length`
	`segment_shift`,`segment_length`+`segment_shift`
	2`segment_shift`,`segment_length`+2`segment_shift`
	3`segment_shift`,`segment_length`+3`segment_shift`
	...
The animation stops after the end of the provided data; when `segment_length`+N`segment_shift` is larger than the number of elements in `ipoints`