%%%%%%% PIPELINE FOR THE TRAINING OF A ACTIGRAPHY-BASED SLEEP WAKE
%%%%%%% PREDICTION ALGORITHM

% The following code allow, from the publicly available raw data, the
% results from the following article:

% Actigraphy algorithm against 32-hour continuous polysomnography to assess sleep-wake patterns in patients with suspected idiopathic hypersomnia
% Tugdual Adam, Msc 1,2, Jérôme Tanty 2, Lucie Barateau, MD, PhD 1,2,3, Yves Dauvilliers, MD, PhD 1,2,3 *
%1 Institute of Neurosciences of Montpellier (INM), University of Montpellier, INSERM, France 
%2 Sleep-Wake Disorders Unit, Department of Neurology, Gui-de-Chauliac Hospital, CHU Montpellier, France
%3 National Reference Centre for Orphan Diseases, Narcolepsy, Idiopathic Hypersomnia, and Kleine-Levin Syndrome, Montpellier, France

% The data is available on an online storage at : [LINK]
% The code was run with the following configuration 
%{
MATLAB Version: 9.10.0.1602886 (R2021a)
 MATLAB License Number: 968398
Operating System: Microsoft Windows 10 Professionnel Version 10.0 (Build 19045)
Java Version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
-----------------------------------------------------------------------------------------------------
MATLAB                                                Version 9.10        (R2021a)
Simulink                                              Version 10.3        (R2021a)
5G Toolbox                                            Version 2.2         (R2021a)
AUTOSAR Blockset                                      Version 2.4         (R2021a)
Aerospace Blockset                                    Version 5.0         (R2021a)
Aerospace Toolbox                                     Version 4.0         (R2021a)
Antenna Toolbox                                       Version 5.0         (R2021a)
Audio Toolbox                                         Version 3.0         (R2021a)
Automated Driving Toolbox                             Version 3.3         (R2021a)
Bioinformatics Toolbox                                Version 4.15.1      (R2021a)
Communications Toolbox                                Version 7.5         (R2021a)
Computer Vision Toolbox                               Version 10.0        (R2021a)
Control System Toolbox                                Version 10.10       (R2021a)
Curve Fitting Toolbox                                 Version 3.5.13      (R2021a)
DDS Blockset                                          Version 1.0         (R2021a)
DO Qualification Kit                                  Version 3.11        (R2021a)
DSP System Toolbox                                    Version 9.12        (R2021a)
Data Acquisition Toolbox                              Version 4.3         (R2021a)
Database Toolbox                                      Version 10.1        (R2021a)
Datafeed Toolbox                                      Version 6.0         (R2021a)
Deep Learning HDL Toolbox                             Version 1.1         (R2021a)
Deep Learning Toolbox                                 Version 14.2        (R2021a)
Econometrics Toolbox                                  Version 5.6         (R2021a)
Embedded Coder                                        Version 7.6         (R2021a)
Filter Design HDL Coder                               Version 3.1.9       (R2021a)
Financial Instruments Toolbox                         Version 3.2         (R2021a)
Financial Toolbox                                     Version 6.1         (R2021a)
Fixed-Point Designer                                  Version 7.2         (R2021a)
Fuzzy Logic Toolbox                                   Version 2.8.1       (R2021a)
GPU Coder                                             Version 2.1         (R2021a)
Global Optimization Toolbox                           Version 4.5         (R2021a)
HDL Coder                                             Version 3.18        (R2021a)
HDL Verifier                                          Version 6.3         (R2021a)
IEC Certification Kit                                 Version 3.17        (R2021a)
Image Acquisition Toolbox                             Version 6.4         (R2021a)
Image Processing Toolbox                              Version 11.3        (R2021a)
Instrument Control Toolbox                            Version 4.4         (R2021a)
LTE Toolbox                                           Version 3.5         (R2021a)
Lidar Toolbox                                         Version 1.1         (R2021a)
MATLAB Coder                                          Version 5.2         (R2021a)
MATLAB Compiler                                       Version 8.2         (R2021a)
MATLAB Compiler SDK                                   Version 6.10        (R2021a)
MATLAB Parallel Server                                Version 7.4         (R2021a)
MATLAB Report Generator                               Version 5.10        (R2021a)
Mapping Toolbox                                       Version 5.1         (R2021a)
Mixed-Signal Blockset                                 Version 2.0         (R2021a)
Model Predictive Control Toolbox                      Version 7.1         (R2021a)
Model-Based Calibration Toolbox                       Version 5.10        (R2021a)
Motor Control Blockset                                Version 1.2         (R2021a)
Navigation Toolbox                                    Version 2.0         (R2021a)
OPC Toolbox                                           Version 5.0.2       (R2021a)
Optimization Toolbox                                  Version 9.1         (R2021a)
Parallel Computing Toolbox                            Version 7.4         (R2021a)
Partial Differential Equation Toolbox                 Version 3.6         (R2021a)
Phased Array System Toolbox                           Version 4.5         (R2021a)
Polyspace Bug Finder                                  Version 3.4         (R2021a)
Polyspace Bug Finder Server                           Version 3.4         (R2021a)
Polyspace Code Prover                                 Version 10.4        (R2021a)
Polyspace Code Prover Server                          Version 10.4        (R2021a)
Powertrain Blockset                                   Version 1.9         (R2021a)
Predictive Maintenance Toolbox                        Version 2.3         (R2021a)
RF Blockset                                           Version 8.1         (R2021a)
RF Toolbox                                            Version 4.1         (R2021a)
ROS Toolbox                                           Version 1.3         (R2021a)
Radar Toolbox                                         Version 1.0         (R2021a)
Reinforcement Learning Toolbox                        Version 2.0         (R2021a)
Risk Management Toolbox                               Version 1.9         (R2021a)
Robotics System Toolbox                               Version 3.3         (R2021a)
Robust Control Toolbox                                Version 6.10        (R2021a)
Satellite Communications Toolbox                      Version 1.0         (R2021a)
Sensor Fusion and Tracking Toolbox                    Version 2.1         (R2021a)
SerDes Toolbox                                        Version 2.1         (R2021a)
Signal Processing Toolbox                             Version 8.6         (R2021a)
SimBiology                                            Version 6.1         (R2021a)
SimEvents                                             Version 5.10        (R2021a)
Simscape                                              Version 5.1         (R2021a)
Simscape Driveline                                    Version 3.3         (R2021a)
Simscape Electrical                                   Version 7.5         (R2021a)
Simscape Fluids                                       Version 3.2         (R2021a)
Simscape Multibody                                    Version 7.3         (R2021a)
Simulink 3D Animation                                 Version 9.2         (R2021a)
Simulink Check                                        Version 5.1         (R2021a)
Simulink Code Inspector                               Version 3.8         (R2021a)
Simulink Coder                                        Version 9.5         (R2021a)
Simulink Compiler                                     Version 1.2         (R2021a)
Simulink Control Design                               Version 5.7         (R2021a)
Simulink Coverage                                     Version 5.2         (R2021a)
Simulink Design Optimization                          Version 3.9.1       (R2021a)
Simulink Design Verifier                              Version 4.5         (R2021a)
Simulink Desktop Real-Time                            Version 5.12        (R2021a)
Simulink PLC Coder                                    Version 3.4         (R2021a)
Simulink Real-Time                                    Version 7.1         (R2021a)
Simulink Report Generator                             Version 5.10        (R2021a)
Simulink Requirements                                 Version 1.7         (R2021a)
Simulink Test                                         Version 3.4         (R2021a)
SoC Blockset                                          Version 1.4         (R2021a)
Spreadsheet Link                                      Version 3.4.5       (R2021a)
Stateflow                                             Version 10.4        (R2021a)
Statistics and Machine Learning Toolbox               Version 12.1        (R2021a)
Symbolic Math Toolbox                                 Version 8.7         (R2021a)
System Composer                                       Version 2.0         (R2021a)
System Identification Toolbox                         Version 9.14        (R2021a)
Text Analytics Toolbox                                Version 1.7         (R2021a)
UAV Toolbox                                           Version 1.1         (R2021a)
Vehicle Dynamics Blockset                             Version 1.6         (R2021a)
Vehicle Network Toolbox                               Version 5.0         (R2021a)
Vision HDL Toolbox                                    Version 2.3         (R2021a)
WLAN Toolbox                                          Version 3.2         (R2021a)
Wavelet Toolbox                                       Version 5.6         (R2021a)
Wireless HDL Toolbox                                  Version 2.2  
%}

% Additionally, two custom functions are required, and available in the
% data storage, but were not developed by me:
% spider_plot : https://fr.mathworks.com/matlabcentral/fileexchange/59561-spider_plot
% cohensKappa : https://fr.mathworks.com/matlabcentral/fileexchange/69943-simple-cohen-s-kappa

% The code contains 6 blocks
% Blocks 1-5 are aimed are reproducing the findings from the article
% Block 6 allows the user to predict sleep/wake on their own data, this
% block may be used independently from the others, in that case the user
% needs to load the already-trained model "full_model" in the workspace
% before proceeding 

% Note that the code includes a random component, and unfortunately no
% seeding was performed on this account. Although the use of bootstraps
% greatly reduces the impact of randomness on the results, it is unlikely
% that this pipeline reproduces the exact same results that were reported
% in the article.
% Note that, if the user wants to reproduce the entirety of the results,
% including the 300-sample bootstraping procedure, the latter may take as
% long as 2-12 hours depending on the computer specifications.

% For any further questions, please contact me at the following:
% tugdual.adam@gmail.com

% Kindly, Tugdual Adam
%% 1 - Preparation of the data for training

path = ''; %path to data as a .mat file
% Data structure should be the following:
% cell array named "data", each element corresponding to one subject
%   Each cell is a structure array containing the following fields: 
%       - time: Nx1 vector, hh:mm:ss, continuing past midnight without resetting to 0, for example, 1:00 AM would be 25:00:00, and so on
%       - act: Nx1 vector, activity counts at each timestep
%       - hypno: Nx1 vector, sleep stage at each timestep: 1 = wake, 2 = REM sleep, 3 = N1, 4 = N2, 5 = N3
%       - pred_aw: Nx1 vector, predictions from ActiWatch2, 1 = wake, 0 = sleep
    
load(fullfile(path,'data.mat'));
addpath('') % path to additional functions 

% Normalization step

zscore_data = {};

for ii = 1:length(data)
    tmp = data{ii}.act;
    tmp(tmp<5) = 0;  % Remove very low amplitude activity counts 
    min200 = mink(tmp(tmp>0),100);    
    stdtmp = nanstd(min200);
    tmp2 = tmp/stdtmp; % Normalization by the standard deviation of 100 non-zero lowest values
    zscore_data{ii} = tmp2;
end


% Compute features

X_ann = {};
Y_ann = {};
for ii=1:length(zscore_data)
    
    acti = zscore_data{ii};
    acti(isnan(acti)) = 0; % set NaN values to 0
    dacti = [0; diff(acti)]; 
    time_acti = data{ii}.time;
    hypno = data{ii}.hypno;
    tmpy = [];
    TMP = [];
    id_k = 1;
    for jj = 16:length(acti)-15 % because we consider centered windows of size up to 30, the first and last 15 elements may not be scored
        tmpy = [tmpy;hypno(jj)];
        tmpoffset = [];
        lognat = log(acti(jj)+1);
        TIMESIN = sin(2*pi*seconds(time_acti(jj))/(24*60*60)); % cyclic encoding of time
        TIMECOS = cos(2*pi*seconds(time_acti(jj))/(24*60*60)); % cyclic encoding of time
        tmpoffset = [tmpoffset;lognat;TIMESIN;TIMECOS;dacti(jj-1);dacti(jj);dacti(jj+1)];
        for offset = 2:15
            centered_window = acti(jj-offset:jj+offset);
            centered_window(isnan(centered_window)) = [];
            
            mean_cen = nanmean(centered_window);
            med_cen = median(centered_window);
            std_cen = nanstd(centered_window);
            Q3_cen = sum(centered_window>=quantile(acti(acti>0),0.75))/length(centered_window);
            any_cen = sum(centered_window>0)/length(centered_window)/length(centered_window);
            
            if isempty(centered_window)
                min_cen = NaN;
            else
                min_cen = min(centered_window);
            end
            if isempty(centered_window)
                max_cen = NaN;
            else
                max_cen = max(centered_window);
            end
            
            skew_cen = skewness(centered_window);
            kurto_cen = kurtosis(centered_window);
            if length(unique(centered_window(~isnan(centered_window))))==1 
                skew_cen = 0;
                kurto_cen = 9/5;
            end
            
            tmpoffset = [tmpoffset;mean_cen;med_cen;std_cen;min_cen;max_cen;Q3_cen;any_cen;skew_cen;kurto_cen];
        end
               
        TMP(:,id_k) = tmpoffset;
        id_k = id_k+1;
    end
    X_ann{ii} = [TMP;acti(16:end-15)'];
    Y_ann{ii} = tmpy;
end


%% 2 - Training of the network for performance assesments (bootstraps)

% Network architecture

layers_ann = [ ...
    sequenceInputLayer(height(X_ann{1,1}))
    bilstmLayer(150,'OutputMode','sequence')
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

options_ann = trainingOptions('adam', ...
    'MaxEpochs',60, ...
    'MiniBatchSize',32, ...
    'InitialLearnRate',0.001, ...
    'LearnRateDropFactor',0.2, ...
    'GradientThreshold',2, ...
    'Verbose',0);

% Training and bootstrap procedure


k=1;

perf_aw = struct('AGREE',[],'SENSI',[],'SPECI',[],'PVS',[],'PVW',[],'F1',[],'ckappa',[],...
    'SENSI_DT',[],'SPECI_DT',[],'PVS_DT',[],'PVW_DT',[],...
    'SENSI_NT',[],'SPECI_NT',[],'PVS_NT',[],'PVW_NT',[]);
perf_s2s = struct('AGREE',[],'SENSI',[],'SPECI',[],'PVS',[],'PVW',[],'F1',[],'ckappa',[],...
    'SENSI_DT',[],'SPECI_DT',[],'PVS_DT',[],'PVW_DT',[],...
    'SENSI_NT',[],'SPECI_NT',[],'PVS_NT',[],'PVW_NT',[]);

% BAGGING
id_test_boot = [];
YPred_boot = [];
for boot = 1:300
    id_rand = randsample(length(data),round(0.75*length(data)),true);
    id_boot = id_rand;  
    id_test = setdiff(1:length(data),id_boot);
    
    data_X_train = X_ann(id_boot)';
    data_Y_train = cellfun(@(x) categorical(x==1)', Y_ann(id_boot), 'UniformOutput', false)';
    data_X_test = X_ann(id_test)';
    data_Y_test = cellfun(@(x) categorical(x==1)', Y_ann(id_test), 'UniformOutput', false)';

     
    % Replace NaNs with the mean across all samples
    
    for ii = 1:size(data_X_train,1)
        tmpxtrain = data_X_train{ii};      
        for jj = 1:height(tmpxtrain)
            tmp = nanmean(tmpxtrain(jj,:));
            if isnan(tmp)
                tmp = 0;
            end
            tmpxtrain(jj,isnan(tmpxtrain(jj,:))) = tmp;
            
        end
        data_X_train{ii} = tmpxtrain;        
    end
    
    for ii =1:size(data_X_test,1)
        tmpxtest = data_X_test{ii};
        for jj = 1:height(tmpxtest)
            tmp = nanmean(tmpxtrain(jj,:));
            if isnan(tmp)
                tmp = 0;
            end
            tmpxtest(jj,isnan(tmpxtest(jj,:))) = tmp;
        end
        data_X_test{ii} = tmpxtest;
    end
    
    
    % Network training
    mdl = trainNetwork(data_X_train,data_Y_train,layers_ann,options_ann);
    
    % Compute performance metrics for S2S and AW
    
    YPred = classify(mdl,data_X_test);
    
    for ii=1:length(YPred)
        
        % S2S
             
        truevec = data_Y_test{ii};
        predvec = YPred{ii};
        time = data{id_test(ii)}.time(16:end-15);
        CM = confusionmat(truevec,predvec);     
        
        perf_s2s.AGREE(k) = (CM(1,1) + CM(2,2)) / sum(sum(CM));
        perf_s2s.SENSI(k) = CM(1,1)/(CM(1,1)+CM(1,2));
        perf_s2s.SPECI(k) = CM(2,2)/(CM(2,2)+CM(2,1));
        perf_s2s.PVS(k) = CM(1,1)/(CM(1,1)+CM(2,1));
        perf_s2s.PVW(k) = CM(2,2)/(CM(2,2)+CM(1,2));
        perf_s2s.F1(k) = CM(1,1) / (CM(1,1) + 0.5*(CM(1,2) + CM(2,1)));
        perf_s2s.ckappa(k) = cohensKappa(truevec,predvec);
        
        % Split into daytime and nighttime
        [~,id1] = min(abs(time-duration(31,0,0)));
        [~,id2] = min(abs(time-duration(47,0,0)));
        
        % Daytime
        if id2-id1>500
            CM_DT = confusionmat(truevec(id1+1:id2),predvec(id1+1:id2));
            perf_s2s.SENSI_DT(k) = CM_DT(1,1)/(CM_DT(1,1)+CM_DT(1,2));
            perf_s2s.SPECI_DT(k) = CM_DT(2,2)/(CM_DT(2,2)+CM_DT(2,1));
            perf_s2s.PVS_DT(k) = CM_DT(1,1)/(CM_DT(1,1)+CM_DT(2,1));
            perf_s2s.PVW_DT(k) = CM_DT(2,2)/(CM_DT(2,2)+CM_DT(1,2));
        else % if few data, set to NaN
            perf_s2s.SENSI_DT(k) = NaN;
            perf_s2s.SPECI_DT(k) = NaN;
            perf_s2s.PVS_DT(k) = NaN;
            perf_s2s.PVW_DT(k) = NaN;
        end
        %Nighttime
        if id2-id1>500
            CM_NT = confusionmat(truevec([1:id1 id2+1:end]),predvec([1:id1 id2+1:end]));
            perf_s2s.SENSI_NT(k) = CM_NT(1,1)/(CM_NT(1,1)+CM_NT(1,2));
            perf_s2s.SPECI_NT(k) = CM_NT(2,2)/(CM_NT(2,2)+CM_NT(2,1));
            perf_s2s.PVS_NT(k) = CM_NT(1,1)/(CM_NT(1,1)+CM_NT(2,1));
            perf_s2s.PVW_NT(k) = CM_NT(2,2)/(CM_NT(2,2)+CM_NT(1,2));
        else
            perf_s2s.SENSI_NT(k) = NaN;
            perf_s2s.SPECI_NT(k) = NaN;
            perf_s2s.PVS_NT(k) = NaN;
            perf_s2s.PVW_NT(k) = NaN;
        end
        
        % AW
        
        truevec = data_Y_test{ii};
        pred_aw = data{id_test(ii)}.pred_aw(16:end-15);
        time = data{id_test(ii)}.time(16:end-15);
        CM = confusionmat(double(truevec)-1,pred_aw);     
        
        perf_aw.AGREE(k) = (CM(1,1) + CM(2,2)) / sum(sum(CM));
        perf_aw.SENSI(k) = CM(1,1)/(CM(1,1)+CM(1,2));
        perf_aw.SPECI(k) = CM(2,2)/(CM(2,2)+CM(2,1));
        perf_aw.PVS(k) = CM(1,1)/(CM(1,1)+CM(2,1));
        perf_aw.PVW(k) = CM(2,2)/(CM(2,2)+CM(1,2));
        perf_aw.F1(k) = CM(1,1) / (CM(1,1) + 0.5*(CM(1,2) + CM(2,1)));
        perf_aw.ckappa(k) = cohensKappa(double(truevec)-1,pred_aw);
        
        % Split into daytime and nighttime
        [~,id1] = min(abs(time-duration(31,0,0)));
        [~,id2] = min(abs(time-duration(47,0,0)));
        
        % Daytime
        if id2-id1>500
            CM_DT = confusionmat(double(truevec(id1+1:id2))-1,pred_aw(id1+1:id2));
            perf_aw.SENSI_DT(k) = CM_DT(1,1)/(CM_DT(1,1)+CM_DT(1,2));
            perf_aw.SPECI_DT(k) = CM_DT(2,2)/(CM_DT(2,2)+CM_DT(2,1));
            perf_aw.PVS_DT(k) = CM_DT(1,1)/(CM_DT(1,1)+CM_DT(2,1));
            perf_aw.PVW_DT(k) = CM_DT(2,2)/(CM_DT(2,2)+CM_DT(1,2));
        else % if few data, set to NaN
            perf_aw.SENSI_DT(k) = NaN;
            perf_aw.SPECI_DT(k) = NaN;
            perf_aw.PVS_DT(k) = NaN;
            perf_aw.PVW_DT(k) = NaN;
        end
        %Nighttime
        if id2-id1>500
            CM_NT = confusionmat(double(truevec([1:id1 id2+1:end]))-1,pred_aw([1:id1 id2+1:end]));
            perf_aw.SENSI_NT(k) = CM_NT(1,1)/(CM_NT(1,1)+CM_NT(1,2));
            perf_aw.SPECI_NT(k) = CM_NT(2,2)/(CM_NT(2,2)+CM_NT(2,1));
            perf_aw.PVS_NT(k) = CM_NT(1,1)/(CM_NT(1,1)+CM_NT(2,1));
            perf_aw.PVW_NT(k) = CM_NT(2,2)/(CM_NT(2,2)+CM_NT(1,2));
        else
            perf_aw.SENSI_NT(k) = NaN;
            perf_aw.SPECI_NT(k) = NaN;
            perf_aw.PVS_NT(k) = NaN;
            perf_aw.PVW_NT(k) = NaN;
        end
        
        k=k+1;
    end
    id_test_boot = [id_test_boot id_test];
    YPred_boot = [YPred_boot;YPred];
end

%% 3 - Plot and compare performances

% Overall metrics
P = [nanmean(perf_aw.AGREE) nanmean(perf_aw.SENSI) nanmean(perf_aw.SPECI) nanmean(perf_aw.PVS) nanmean(perf_aw.PVW) nanmean(perf_aw.F1) nanmean(perf_aw.ckappa);... 
     nanmean(perf_s2s.AGREE) nanmean(perf_s2s.SENSI) nanmean(perf_s2s.SPECI) nanmean(perf_s2s.PVS) nanmean(perf_s2s.PVW) nanmean(perf_s2s.F1) nanmean(perf_s2s.ckappa)];
% Daytime metrics
P_dt = [nanmean(perf_aw.SENSI_DT) nanmean(perf_aw.SPECI_DT) nanmean(perf_aw.PVS_DT) nanmean(perf_aw.PVW_DT);... 
     nanmean(perf_s2s.SENSI_DT) nanmean(perf_s2s.SPECI_DT) nanmean(perf_s2s.PVS_DT) nanmean(perf_s2s.PVW_DT)];
% Nighttime metrics
P_nt = [nanmean(perf_aw.SENSI_NT) nanmean(perf_aw.SPECI_NT) nanmean(perf_aw.PVS_NT) nanmean(perf_aw.PVW_NT);... 
     nanmean(perf_s2s.SENSI_NT) nanmean(perf_s2s.SPECI_NT) nanmean(perf_s2s.PVS_NT) nanmean(perf_s2s.PVW_NT)];

 
 figure
 tiledlayout(1,3)
 t1=nexttile;
 sp=spider_plot(P*100,...
     'AxesLabels', {'Accuracy', 'Sensitivity', 'Specificity', 'Predictive Value for Sleep', 'Predictive Value for Wake','F1-score',"Cohen's kappa"},...
     'AxesInterval', 5,...
     'AxesLimits', [ones(1,7)*40; ones(1,7)*100],...
     'Color',[[206 122 65]/256;[70 105 58]/256],...
     'FillOption', {'off','off'},...
     'FillTransparency', [0.2 0.2],...
     'AxesDisplay','one',...
     'AxesFontSize', 8,...
     'LabelFontSize', 8);
 title(t1,'Whole-recording metrics')
 t2=nexttile;
 sp=spider_plot(P_dt*100,...
     'AxesLabels', {'Sensitivity', 'Specificity', 'Predictive Value for Sleep', 'Predictive Value for Wake',},...
     'AxesInterval', 5,...
     'AxesLimits', [ones(1,4)*40; ones(1,4)*100],...
     'Color',[[206 122 65]/256;[70 105 58]/256],...
     'FillOption', {'off','off'},...
     'FillTransparency', [0.2 0.2],...
     'AxesDisplay','one',...
     'AxesFontSize', 8,...
     'LabelFontSize', 8);
 title(t2,'Daytime metrics')
 t3=nexttile;
 sp=spider_plot(P_nt*100,...
     'AxesLabels', {'Sensitivity', 'Specificity', 'Predictive Value for Sleep', 'Predictive Value for Wake'},...
     'AxesInterval', 5,...
     'AxesLimits', [ones(1,4)*40; ones(1,4)*100],...
     'Color',[[206 122 65]/256;[70 105 58]/256],...
     'FillOption', {'off','off'},...
     'FillTransparency', [0.2 0.2],...
     'AxesDisplay','one',...
     'AxesFontSize', 8,...
     'LabelFontSize', 8);
 title(t3,'Nighttime metrics')
 lgd=legend({'AS','S2S','Sadeh','Random forest','CNN 2'},'NumColumns',2)
 lgd.Layout.Tile = 'south'

%% 4 - Compute and plot absolute, type 1 and type 2 error

cm_cell = {}; % for each prediction in each bootstrap sample, we will store the confusion matrices, overall, and split in 4x8hours
for ii=1:length(YPred_boot)
    ii
    hypno = Y_ann{id_test_boot(ii)};
    predvec = YPred_boot{ii};
    predvec = double(predvec)-1;
    pred_AW = data{id_test_boot(ii)}.pred_aw(16:end-15);
    time = data{id_test_boot(ii)}.time(16:end-15);
    
    [~,id1] = min(abs(time-duration(23,0,0)));
    [~,id2] = min(abs(time-duration(23+8,0,0)));
    [~,id3] = min(abs(time-duration(23+16,0,0)));
    [~,id4] = min(abs(time-duration(23+24,0,0)));
    [~,id5] = min(abs(time-duration(23+32,0,0)));
    
    mat_tmp = [];
    % Overall
    if id5-id1 > 30*60*2
        tmp_aw = pred_AW(id1:id5);
        tmp_s2s = predvec(id1:id5);
        hypno_tmp = double(hypno(id1:id5)==1);
        cm1 = confusionmat(hypno_tmp,tmp_aw) ;
        cm2 = confusionmat(hypno_tmp,tmp_s2s) ;
        mat_tmp(1,5) = cm1(1,2);
        mat_tmp(2,5) = cm1(2,1);
        mat_tmp(3,5) = cm2(1,2);
        mat_tmp(4,5) = cm2(2,1);
    else
        mat_tmp(1,5) = nan;
        mat_tmp(2,5) = nan;
        mat_tmp(3,5) = nan;
        mat_tmp(4,5) = nan;
    end
    
    %23h-7h
    if id2-id1>900
        tmp_aw = pred_AW(id1:id2);
        tmp_s2s = predvec(id1:id2);
        hypno_tmp = double(hypno(id1:id2)==1);
        cm1 = confusionmat(hypno_tmp,tmp_aw) ;
        cm2 = confusionmat(hypno_tmp,tmp_s2s) ;
        mat_tmp(1,1) = cm1(1,2);
        mat_tmp(2,1) = cm1(2,1);
        mat_tmp(3,1) = cm2(1,2);
        mat_tmp(4,1) = cm2(2,1);
    else
        mat_tmp(1,1) = nan;
        mat_tmp(2,1) = nan;
        mat_tmp(3,1) = nan;
        mat_tmp(4,1) = nan;
    end
    %7h-15h
    if id3-id2>900
        tmp_aw = pred_AW(id2:id3);
        tmp_s2s = predvec(id2:id3);
        hypno_tmp = double(hypno(id2:id3)==1);
        cm1 = confusionmat(hypno_tmp,tmp_aw) ;
        cm2 = confusionmat(hypno_tmp,tmp_s2s) ;
        mat_tmp(1,2) = cm1(1,2);
        mat_tmp(2,2) = cm1(2,1);
        mat_tmp(3,2) = cm2(1,2);
        mat_tmp(4,2) = cm2(2,1);
    else
        mat_tmp(1,2) = nan;
        mat_tmp(2,2) = nan;
        mat_tmp(3,2) = nan;
        mat_tmp(4,2) = nan;
        
    end
    %15h-23h
    if id4-id3 > 900
        tmp_aw = pred_AW(id3:id4);
        tmp_s2s = predvec(id3:id4);
        hypno_tmp = double(hypno(id3:id4)==1);
        cm1 = confusionmat(hypno_tmp,tmp_aw) ;
        cm2 = confusionmat(hypno_tmp,tmp_s2s) ;
        mat_tmp(1,3) = cm1(1,2);
        mat_tmp(2,3) = cm1(2,1);
        if length(cm2)>1
            mat_tmp(3,3) = cm2(1,2);
            mat_tmp(4,3) = cm2(2,1);
        else
            mat_tmp(3,3) = 0;
            mat_tmp(4,3) = 0;
        end
    else
        mat_tmp(1,3) = nan;
        mat_tmp(2,3) = nan;
        mat_tmp(3,3) = nan;
        mat_tmp(4,3) = nan;
    end
    %23h-7h
    if id5-id4>900
        tmp_aw = pred_AW(id4:id5);
        tmp_s2s = predvec(id4:id5);
        hypno_tmp = double(hypno(id4:id5)==1);
        cm1 = confusionmat(hypno_tmp,tmp_aw) ;
        cm2 = confusionmat(hypno_tmp,tmp_s2s) ;
        mat_tmp(1,4) = cm1(1,2);
        mat_tmp(2,4) = cm1(2,1);
        if length(cm2)>1
            mat_tmp(3,4) = cm2(1,2);
            mat_tmp(4,4) = cm2(2,1);
        else
            mat_tmp(3,4) = 0;
            mat_tmp(4,4) = 0;
        end
    else
        mat_tmp(1,4) = nan;
        mat_tmp(2,4) = nan;
        mat_tmp(3,4) = nan;
        mat_tmp(4,4) = nan;
    end
    cm_cell{ii} = mat_tmp;
end
    
type1_err = [];
type2_err = [];
%prepare data to plot
for ii=1:length(cm_cell)
    tmp = cm_cell{ii};
    error_aw = tmp(1,:)+tmp(2,:);
    error_s2s = tmp(3,:)+tmp(4,:);
    type1_err = [type1_err [tmp(2,:) tmp(4,:) ; 1 3 5 7 9 2 4 6 8 10]];
    type2_err = [type2_err [tmp(1,:) tmp(3,:) ; 1 3 5 7 9 2 4 6 8 10]];
end
% In type1_err and type2_err, first line represent the error (type 1 or
% type 2) in number of epochs (30sec), and second line is an identifier,
% according to the following:
% AW: 23h-7h (1), 7h-15h (3), 15h-23h (5), 23h-7h (7), whole-recording (9)
% S2S: 23h-7h (2), 7h-15h (4), 15h-23h (6), 23h-7h (8), whole-recording (10)
    
f=figure;
tiledlayout(2,1,'TileSpacing','none')
t1=nexttile;
hold on
patch([0.75 4.5 4.5 0.75],[0 0 700 700],[0.4667    0.6745    0.1882],'FaceAlpha',0.3)
boxplot(type1_err(1,:)/2,type1_err(2,:),'Positions',[1 1.25 1.75 2 2.5 2.75 3.25 3.5 4 4.25],'symbol','')
h = findobj(gca,'Tag','Box');
for j=1:2:length(h)
    p1=patch(get(h(j),'XData'),get(h(j),'YData'),[0.2 0.2 0.2],'FaceAlpha',.5);
end
for j=2:2:length(h)
    p2=patch(get(h(j),'XData'),get(h(j),'YData'),[0.8 0.8 0.8],'FaceAlpha',.5);
end
xline(3.75,'--')
xlim([0.75 4.5])
ylim([0 700])
ylabel('Type 1 error (min)')
legend([p1 p2],{'S2S','AW'},'Location','northwest')
t2 = nexttile;
hold on
patch([0.75 4.5 4.5 0.75],[0 0 -700 -700],[0.6353    0.0784    0.1843],'FaceAlpha',0.3)
boxplot(-type2_err(1,:)/2,type2_err(2,:),'Positions',[1 1.25 1.75 2 2.5 2.75 3.25 3.5 4 4.25],'symbol','')
h = findobj(gca,'Tag','Box');
for j=1:2:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),[0.2 0.2 0.2],'FaceAlpha',.5);
end
for j=2:2:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),[0.8 0.8 0.8],'FaceAlpha',.5);
end
xline(3.75,'--')
xticks([1.125 1.875 2.625 3.375 4.125])
xticklabels({'Night 1 - 11pm-7am','Daytime 1 - 7am-3pm','Daytime 2 - 3pm-11pm','Night 2 - 11pm-7am', 'Whole recording'})
xlim([0.75 4.5])
ylim([-700 0])
ylabel('Type 2 error (min)')


% Absolute error - simply is the sum of type 1 and type 2 errors

abs_err = [];
%prepare data to plot
for ii=1:length(cm_cell)
    tmp = cm_cell{ii};
    abs_err = [abs_err [tmp(1,:)+tmp(2,:) tmp(3,:)+tmp(4,:); 1 3 5 7 9 2 4 6 8 10]];
end

    
f2=figure;
hold on
boxplot(abs_err(1,:)/2,abs_err(2,:),'Positions',[1 1.25 1.75 2 2.5 2.75 3.25 3.5 4 4.25],'symbol','')
h = findobj(gca,'Tag','Box');
for j=1:2:length(h)
    p1=patch(get(h(j),'XData'),get(h(j),'YData'),[0.2 0.2 0.2],'FaceAlpha',.5);
end
for j=2:2:length(h)
    p2=patch(get(h(j),'XData'),get(h(j),'YData'),[0.8 0.8 0.8],'FaceAlpha',.5);
end
xline(3.75,'--')
xlim([0.75 4.5])
ylim([0 700])
legend([p1 p2],{'S2S','AS'},'Location','northwest')
xticks([1.125 1.875 2.625 3.375 4.125])
xticklabels({'Night 1 - 11pm-7am','Daytime 1 - 7am-3pm','Daytime 2 - 3pm-11pm','Night 2 - 11pm-7am', 'Whole recording'})

xlim([0.75 4.5])
ylabel('Absolute error (min)')


%% 5 - Training of the full model (on all the data) for further prediction of your own data
% this full model is the model made available on the data storage
% "full_mdl"

data_X_train = X_ann';
data_Y_train = cellfun(@(x) categorical(x==1)', Y_ann, 'UniformOutput', false)';

% Remove NaNs

for ii = 1:size(data_X_train,1)
    tmpxtrain = data_X_train{ii};
    
    
    for jj = 1:height(X_ann{1,1})
        tmpxtrain(jj,isnan(tmpxtrain(jj,:))) = nanmean(tmpxtrain(jj,:));
        
    end
    data_X_train{ii} = tmpxtrain;
    
end

% Network training
full_mdl = trainNetwork(data_X_train,data_Y_train,layers_ann,options_ann);

%% 6 - Predict on your own data
% to predict on your own data, you need to upload a new "data" cell array, as described above,
% compute features, and from the feature matrices, predict wake/sleep with
% the trained algorithm

path = 'D:\PhD\ACTIMETRIE\DATA'; %path to your new data as a .mat file
load(fullfile(path,'data_new.mat'));

% Normalization step

zscore_data_new = {};

for ii = 1:length(data_new)
    tmp = data_new{ii}.act;
    tmp(tmp<5) = 0;  % Remove very low amplitude activity counts 
    min200 = mink(tmp(tmp>0),100);    
    stdtmp = nanstd(min200);
    tmp2 = tmp/stdtmp; % Normalization by the standard deviation of 100 non-zero lowest values
    zscore_data_new{ii} = tmp2;
end


% Compute features

X_ann_new = {};
Y_ann_new = {};
for ii=1:length(zscore_data_new)
    
    acti = zscore_data_new{ii};
    acti(isnan(acti)) = 0; % set NaN values to 0
    dacti = [0; diff(acti)]; 
    time_acti = data_new{ii}.time;
    TMP = [];
    id_k = 1;
    for jj = 16:length(acti)-15 % because we consider centered windows of size up to 30, the first and last 15 elements may not be scored
        tmpoffset = [];
        lognat = log(acti(jj)+1);
        TIMESIN = sin(2*pi*seconds(time_acti(jj))/(24*60*60)); % cyclic encoding of time
        TIMECOS = cos(2*pi*seconds(time_acti(jj))/(24*60*60)); % cyclic encoding of time
        tmpoffset = [tmpoffset;lognat;TIMESIN;TIMECOS;dacti(jj-1);dacti(jj);dacti(jj+1)];
        for offset = 2:15
            centered_window = acti(jj-offset:jj+offset);
            centered_window(isnan(centered_window)) = [];
            
            mean_cen = nanmean(centered_window);
            med_cen = median(centered_window);
            std_cen = nanstd(centered_window);
            Q3_cen = sum(centered_window>=quantile(acti(acti>0),0.75))/length(centered_window);
            any_cen = sum(centered_window>0)/length(centered_window)/length(centered_window);
            
            if isempty(centered_window)
                min_cen = NaN;
            else
                min_cen = min(centered_window);
            end
            if isempty(centered_window)
                max_cen = NaN;
            else
                max_cen = max(centered_window);
            end
            
            skew_cen = skewness(centered_window);
            kurto_cen = kurtosis(centered_window);
            if length(unique(centered_window(~isnan(centered_window))))==1 
                skew_cen = 0;
                kurto_cen = 9/5;
            end
            
            tmpoffset = [tmpoffset;mean_cen;med_cen;std_cen;min_cen;max_cen;Q3_cen;any_cen;skew_cen;kurto_cen];
        end
               
        TMP(:,id_k) = tmpoffset;
        id_k = id_k+1;
    end
    X_ann_new{ii} = [TMP;acti(16:end-15)'];
end

% Predict

data_X_pred_new = X_ann_new';

% Replace NaNs with mean

for ii = 1:size(data_X_pred_new,1)
    tmpxtrain = data_X_pred_new{ii};
    
    
    for jj = 1:height(X_ann{1,1})
        tmpxtrain(jj,isnan(tmpxtrain(jj,:))) = nanmean(tmpxtrain(jj,:));
        
    end
    data_X_pred_new{ii} = tmpxtrain;
    
end

YPred = classify(full_mdl,data_X_pred_new);
YPred_double = cellfun(@double, YPred, 'UniformOutput', false);
% YPred is a cell array containing as many elements as the input data
% Each elements is a categorical vector where:
%   - true indicates wakefulness
%   - false indicates sleep
% You may turn each vector into doubles, then values are as follow:
%   - 2 indicates wakefulness
%   - 1 indicates sleep