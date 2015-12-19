% This script tests an SVM with different settings
 
%% mix up data
% origExamples = trainingExamples;
% origTargets = targets;
% switcharoo = randperm(length(targets));
% trainingExamples = origExamples(switcharoo,:);
% targets = origTargets(switcharoo);

%% Split data into training/validation and testing

N=floor(0.4*length(targets)); % 1:N training
M=floor(0.5*length(targets)); % N+1:M validation
% M+1:end testing

% default cross-val = 10;
% 'linear', 'gaussian' , 'polynomial' with 'PolynomialOrder' (default=3
%% Train various SVM models
SVM1 = fitcsvm(trainingExamples(1:N,:),targets(1:N),'KernelFunction','linear');
disp('done model #1')
SVM2 = fitcsvm(trainingExamples(1:N,:),targets(1:N),'KernelFunction','gaussian'); 
disp('done model #1')
SVM3 = fitcsvm(trainingExamples(1:N,:),targets(1:N),'KernelFunction','polynomial','PolynomialOrder',2);
disp('done model #3')
SVM4 = fitcsvm(trainingExamples(1:N,:),targets(1:N),'KernelFunction','polynomial','PolynomialOrder',3);
disp('done model #4')
SVM5 = fitcsvm(trainingExamples(1:N,:),targets(1:N),'KernelFunction','polynomial','PolynomialOrder',4);
disp('done model #5')

%% Validate
[label1,score1] = predict(SVM1,trainingExamples(N+1:M,:));
[label2,score2] = predict(SVM2,trainingExamples(N+1:M,:));
[label3,score3] = predict(SVM3,trainingExamples(N+1:M,:));
[label4,score4] = predict(SVM4,trainingExamples(N+1:M,:));
[label5,score5] = predict(SVM5,trainingExamples(N+1:M,:));
error1 = sum(abs(label1-targets(N+1:M)))/length(targets(N+1:M));
error2 = sum(abs(label2-targets(N+1:M)))/length(targets(N+1:M));
error3 = sum(abs(label3-targets(N+1:M)))/length(targets(N+1:M));
error4 = sum(abs(label4-targets(N+1:M)))/length(targets(N+1:M));
error5 = sum(abs(label5-targets(N+1:M)))/length(targets(N+1:M));