function Y_sol = rbfEval(model,input)
numberRuns = size(model.InputArray,1);

for k = 1:model.nY
    dx_norm = zeros(numberRuns,1);
    for i = 1:numberRuns
        if strcmp(model.rbfType, 'linear')
        	dx_norm(i,1) = norm(input-model.InputArray(i,:));
        elseif strcmp(model.rbfType, 'cubic')
            dx_norm(i,1) = norm(input-model.InputArray(i,:)).^3;
        elseif strcmp(model.rbfType, 'gaussian')
            dx_norm(i,1) = exp(-norm(input-model.InputArray(i,:)).^2);
        else
            error('Unacceptable RBF kernal function type!')
        end
    end
    Y_sol(k) = model.lambda_rbf(:,k)'*dx_norm+model.gamma_rbf(:,k)'*[input,1]';
end