close all;clear;clc;

% Parameters

N = 200; %Number of Banana Dataset Values
cycles=1000; %Number of epoches
function_output = 1; %Output function for the neural network (1 = Sigmoid, 2 = TanH, 3 = Identity)  
m = 1; %Number of hidden layer
n = 8; %Number of nodes for every hidden layer

if m < 0
    fprintf('Error: you cannot create a neural network with a negative number of hidden layer\n');
    return;
elseif n < 0
    fprintf('Error: you cannot create a neural network with a negative number of nodes for every hidden layer\n');
    return;
elseif m > 0 && n == 0
    fprintf('Error: you cannot create a neural network with hidden layer without nodes\n');
    return;
end

%Load and show Banana DataSet

[input,target] = loadAndShowBananaDataSet('bananaInput.mat', 'bananaTarget.mat');

XT_all = input;
TT_all = (target > 0);

index=randperm(size(XT_all,1));
index=index(1:2*N);
XT=XT_all(index(1:N),:);
TT=TT_all(index(1:N));
XV=XT_all(index(N+1:2*N),:);
TV=TT_all(index(N+1:2*N));

net = newNet(m,n);

plotDataDS(XT,TT);
title('Training set');
plotDataDS(XV,TV);
title('Validation set');

err_training=zeros(1,cycles);
err_validation=zeros(1,cycles);

for i = 1:cycles
     [DW,DB] = backPropagation(net,XT,TT,function_output);
     net = RProp (net,DW,DB);
     [y_training,a] = feedForward(net,XT,function_output);
     err_training(i)= sum(sum((y_training{size(net.W,2)}-TT) .^2))/2;
     [y_validation,a] = feedForward(net,XV,function_output);
     err_validation(i)= sum(sum((y_validation{size(net.W,2)}-TV) .^2))/2;
     fprintf('Cycle: %d; Err_Training: %.4f; Err_Validation: %.4f\n',i,err_training(i),err_validation(i));
end

fprintf('\n\nPrinting graphics...');
figure;
plot(err_training,'b*');
hold on;
plot(err_validation,'r*');
title('Error: BLUE = Training and RED = Validation');
xlabel('Cycles');
ylabel('Error Function');
plotDataDS(XT,y_training{size(net.W,2)}>0.5);
title('Result Training set');
plotDataDS(XV,y_validation{size(net.W,2)}>0.5);
title('Result Validation set');
fprintf('\n\nGraphics correctly printed!\n');

