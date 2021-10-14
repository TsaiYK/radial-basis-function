# radial-basis-function

input_rbf: m-by-nX matrix, where m is the number of input of training data/samples and nX is the dimension of input.

output_rbf: m-by-nY matrix, where nY is the dimension of output.

Both data above is provided as 'example_data.mat' in the repository.

Normalization is highly recommended before training the RBF model.

In line 6 of 'main.m', users can determine the number of training data (nX) by 'num_sample'.

This RBF modeling is applied to the IDETC/CIE2021 paper to train the surrogate model of control policy/strategy/law offline.

"Ying-Kuan Tsai, and Richard J. Malak. \A Methodology for Designing a Feedback Controller via Parametric Optimization: State-Parameterized Nonlinear Programming Control," Proceedings of the IDETC/CIE, Virtual Conference, Online, August 17-20, 2021, ASME Paper No. DETC2021-69295."
