# Actigraphy_Idiopathic_Hypersomnia
Algorithm for sleep/wake prediction based on actigraphy data, in patients with objective or subjective hypersomnolence

This archive contains all the Matlab code and data required to reproduce the results from the following article:

Actigraphy algorithm against 32-hour continuous polysomnography to assess sleep-wake patterns in patients with suspected idiopathic hypersomnia
Tugdual Adam, Msc 1,2, Jérôme Tanty 2, Lucie Barateau, MD, PhD 1,2,3, Yves Dauvilliers, MD, PhD 1,2,3 *
1 Institute of Neurosciences of Montpellier (INM), University of Montpellier, INSERM, France 
2 Sleep-Wake Disorders Unit, Department of Neurology, Gui-de-Chauliac Hospital, CHU Montpellier, France
3 National Reference Centre for Orphan Diseases, Narcolepsy, Idiopathic Hypersomnia, and Kleine-Levin Syndrome, Montpellier, France

- MAIN.m contains the main commented code that guides the user through the correct reproduction of the results
- data.mat is the anonymised raw data of actigraphy and concomittant polysomnography (PSG). PSG and actigraphy were pre-processed to have the following structure:
  • "data" is a cell, where each element corresponding to one subject
  • each cell is a structure array containing the following fields: 
      - time: Nx1 vector, hh:mm:ss, continuing past midnight without resetting to 0, for example, 1:00 AM would be 25:00:00, and so on
      - act: Nx1 vector, activity counts at each timestep
      - hypno: Nx1 vector, sleep stage at each timestep: 1 = wake, 2 = REM sleep, 3 = N1, 4 = N2, 5 = N3
      - pred_aw: Nx1 vector, predictions from ActiWatch2, 1 = wake, 0 = sleep
      Where N is the number of 30-seconds epochs in the whole recording (32hours)
- cohensKappa.m and spider_plot.m are two additionnal functions required for the proper running of the MAIN code, not developed by me
       - see: https://fr.mathworks.com/matlabcentral/fileexchange/69943-simple-cohen-s-kappa      https://fr.mathworks.com/matlabcentral/fileexchange/59561-spider_plot
- full_mdl.mat is the pre-trained complete model, in case users wish to use it on their own data without having to run the whole training again

The code was run with the following Matlab configuration 

%{
MATLAB Version: 9.10.0.1602886 (R2021a)
 MATLAB License Number: 968398
Operating System: Microsoft Windows 10 Professionnel Version 10.0 (Build 19045)
Java Version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
-----------------------------------------------------------------------------------------------------
- MATLAB                                                Version 9.10        (R2021a)
- Simulink                                              Version 10.3        (R2021a)
- 5G Toolbox                                            Version 2.2         (R2021a)
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


MAIN.m contains 6 blocks
- Blocks 1-5 are aimed are reproducing the findings from the article
- Block 6 allows the user to predict sleep/wake on their own data, this block may be used independently from the others, in that case the user needs to load the already-trained model "full_model" in the workspace before proceeding 

Note that the code includes a random component, and unfortunately no seeding was performed on this account. 
Although the use of bootstraps greatly reduces the impact of randomness on the results, it is unlikely that this pipeline reproduces the exact same results that were reported in the article.
Note that, if the user wants to reproduce the entirety of the results, including the 300-sample bootstraping procedure, the latter may take as long as 2-12 hours depending on the computer specifications.

For any further questions, please contact me at the following:
tugdual.adam@gmail.com

Kindly, Tugdual Adam
