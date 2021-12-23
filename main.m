clear
% close all; clc;
load('example_data.mat')

%% Build the surrogate model: RBF
num_sample = size(input_rbf,1);
% Normalization
mean_input = mean(input_rbf);
std_input = std(input_rbf);
input_rbf_normalized = (input_rbf-mean_input)./std_input;

numberOutput = size(output_rbf,2);
numberInput = size(input_rbf,2);
InputArray = input_rbf_normalized(1:num_sample,:); % The training data should be normalized

lambda_rbf = zeros(size(InputArray,1),numberOutput);
gamma_rbf = zeros(numberInput+1,numberOutput);
RBF_model.rbfType = 'gaussian';

% Using RBF to build the surrogate model
for i = 1:numberOutput
    [lambda_rbf(:,i),gamma_rbf(:,i)] = rbfGenerator(size(InputArray,2),...
        InputArray,output_rbf(1:num_sample,:),RBF_model.rbfType);
end

RBF_model.gamma_rbf = gamma_rbf;
RBF_model.InputArray = InputArray;
RBF_model.lambda_rbf = lambda_rbf;
RBF_model.mean_input = mean_input;
RBF_model.std_input = std_input;
RBF_model.nY = numberOutput;

%% Validation
num_test = size(output_rbf,1)-num_sample;
if num_test>0
    error_u = zeros(1,num_test); % initialize
    u_validated = zeros(1,num_test); % initialize
    for i = 1:length(u_opt)-num_sample
        input_rbf_test = input_rbf(i+num_sample,:);
        input_rbf_test_normalized = (input_rbf_test-RBF_model.mean_input)./RBF_model.std_input;
        u_validated(i) = rbfEval(RBF_model,input_rbf_normalized);
        error_u(i) = u_validated(i)-u_opt(i+num_sample);
    end
end

%% Plot the surrogate model
x1_sample = linspace(-1.5,1.5,100);
x2_sample = linspace(-5,5,100);
[X,Y] = meshgrid(x1_sample,x2_sample);
X = X'; Y = Y';
output_rbf_hat = zeros(100,100);
for i = 1:length(x1_sample)
    for j = 1:length(x2_sample)
        input_rbf_sample = [x1_sample(i),x2_sample(j)];
        input_rbf_sample_normalized = (input_rbf_sample-RBF_model.mean_input)./RBF_model.std_input;
        output_rbf_hat(i,j) = rbfEval(RBF_model,input_rbf_sample_normalized);
    end
end
figure
surf(X,Y,output_rbf_hat,'EdgeColor','none'); hold on
plot3(input_rbf(:,1),input_rbf(:,2),output_rbf,'o','MarkerEdgeColor','w',...
    'MarkerSize',5,...
    'MarkerFaceColor','k')
view(-133,24.6)
xlabel('$\phi$ (rad)', 'Interpreter','latex');
ylabel('$\dot{\phi}$ (rad/s)', 'Interpreter','latex')
zlabel('u (N)', 'Interpreter','latex')
set(gcf, 'Renderer', 'Painters');
set(gcf,'Units','Inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
