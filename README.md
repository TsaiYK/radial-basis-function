# radial-basis-function[1,2]

![CodeCogsEqn](https://user-images.githubusercontent.com/33308568/137405080-7b8ead90-459e-462b-9d13-f8445394fbac.png)

input_rbf: m-by-nX matrix, where m is the number of input of training data/samples and nX is the dimension of input.

output_rbf: m-by-nY matrix, where nY is the dimension of output.

Both data above is provided as 'example_data.mat' in the repository.

Normalization is highly recommended before training the RBF model.

In line 6 of 'main.m', users can determine the number of training data (nX) by 'num_sample'.

This RBF modeling is applied to the IDETC/CIE2021 paper to train the surrogate model of control policy/strategy/law offline[3].

## References

[1] Scholten, William, and Darren Hartl. "Uncoupled method for static aeroelastic analysis." Journal of Fluids and Structures 101 (2021): 103221.
[2] Jin, Ruichen, Wei Chen, and Timothy W. Simpson. "Comparative studies of metamodelling techniques under multiple modelling criteria." Structural and multidisciplinary optimization 23, no. 1 (2001): 1-13.
[3] Ying-Kuan Tsai, and Richard J. Malak. "A Methodology for Designing a Feedback Controller via Parametric Optimization: State-Parameterized Nonlinear Programming Control," Proceedings of the IDETC/CIE, Virtual Conference, Online, August 17-20, 2021, ASME Paper No. DETC2021-69295.
