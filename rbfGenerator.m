function [lambda,gamma] = rbfGenerator(numberInputs,InputArray,OutputArray,rbfType)
numberRuns = length(InputArray);
R = zeros(numberRuns,numberRuns);
for i = 1:numberRuns
    for j = i:numberRuns
        sumTest = 0;
        for k = 1:numberInputs
            sumTest = (InputArray(i,k)-InputArray(j,k))^2+sumTest;
        end
        R(i,j) = sumTest;
        R(j,i) = sumTest;
    end
end
R = sqrt(R);
if strcmp(rbfType, 'linear')
    Phi = R;
elseif strcmp(rbfType, 'cubic')
    Phi = R.^3;
elseif strcmp(rbfType, 'gaussian')
    Phi = exp(-R.^2);
else
    error('Unacceptable RBF kernal function type!')
end

A_2 = zeros(numberRuns+numberInputs+1,numberRuns+numberInputs+1);
A_2(1:numberRuns,1:numberRuns) = Phi;
A_2(1:numberRuns,numberRuns+1:numberRuns+numberInputs) = InputArray;
A_2(numberRuns+1:numberRuns+numberInputs,1:numberRuns) = InputArray';
A_2(1:numberRuns,end) = ones(numberRuns,1);
A_2(end,1:numberRuns) = ones(1,numberRuns);
% Y = A_2*X, where X is the vector including lambda and gamma
Y = zeros(numberRuns+numberInputs+1,1);
Y(1:numberRuns) = OutputArray;
X = A_2\Y;
lambda = X(1:numberRuns);
gamma = X(numberRuns+1:end);

