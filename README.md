# radial-basis-function
input_rbf: m-by-nX matrix, where m is the number of input of training data/samples and nX is the dimension of input.
output_rbf: m-by-nY matrix, where nY is the dimension of output.
Both data above is provided as 'example_data.mat' in the repository.
Normalization is highly recommended before training the RBF model.
In line 6 of 'main.m', users can determine the number of training data (nX) by 'num_sample'.
