
# Reconstruction and Filtering in the Time Domain
#### Information Engineering Mini-project 2017-18
[![Oxford Engineering Science](https://www.eng.ox.ac.uk/images/logo.svg)](https://www.eng.ox.ac.uk/)

The principal aim of this project was to develop code for the design of optimal impulse
response sequences for the low-pass filtering of sampled data, and to report on the
code and its results in use. I used several numerical techniques, including optimization and integration, and combined these methods with ideas developed analytically from the Fourier Transform.


## Getting Started

This code will run on a minimal install of [MATLAB](https://uk.mathworks.com/products/matlab.html)


## Code

### 1.1 - Reconstruction

Takes samples of an input function, reconstructs the band limited signals in the time domain and calculates the error between original function and reconstruction.

![Figure 1](/assets/1p1.png)

### 1.2 - Spectrum

Calculates the power spectrum of the samples using the Fast Fourier Transform.

![Figure 2](/assets/1p2.png)

### 2 - Fourier

Calculates a low pass filter using a truncated Fourier series.

![Figure 3](/assets/2.png)

### 3 - Least Squares

Calculates a low pass filter by using a least squares optimiser to fit to a pass (green) and stop (red) band.

![Figure 4](/assets/3.png)

### 4 - Linear Programming

Linear programs have the general form:
![Figure 5](/assets/4e.png)

This section of code calculates a low pass filter by posing the problem as a linear programming problem.
![Figure 5](/assets/4.png)

### 5 - Filter Evaluation

This section combines the code from all previous sections to evaluate how each of the filtering methods performs at low pass filtering the function.
![Figure 6](/assets/5p1.png)

It also evaluates how many discrete terms are required to produce a reasonable filter. Where the lines fit closer to the desired step when the number of terms in increased (although the prevalence of the Gibbs phenomenon also increases).
![Figure 7](/assets/5p2.png)

### 6 - Reconstruction Optimisation

As further exploration for this project I explored how window size (number of terms to include in filter) affected both the sum squared error and the computation time in order to find an optimum value where computation time could be minimised without harming accuracy.
![Figure 8](/assets/6p1.png)

I also performed a 2D grid search on 2 frequency coefficients to so I could minimise error using the lowest bandwidth possible.
![Figure 9](/assets/6p2.png)

## Acknowledgments

Thank you to [M. Pawan Kumar](http://mpawankumar.info/) for the base code that this project was built on
