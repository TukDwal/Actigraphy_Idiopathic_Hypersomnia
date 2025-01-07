# Actigraphy_Idiopathic_Hypersomnia
Algorithm for sleep/wake prediction based on actigraphy data, in patients with objective or subjective hypersomnolence

This archive contains all the Matlab code and data required to reproduce the results from the following article:

_Actigraphy algorithm against 32-hour continuous polysomnography to assess sleep-wake patterns in patients with suspected idiopathic hypersomnia
Tugdual Adam, Msc 1,2, Jérôme Tanty 2, Lucie Barateau, MD, PhD 1,2,3, Yves Dauvilliers, MD, PhD 1,2,3 *_  

_1 Institute of Neurosciences of Montpellier (INM), University of Montpellier, INSERM, France   
2 Sleep-Wake Disorders Unit, Department of Neurology, Gui-de-Chauliac Hospital, CHU Montpellier, France  
3 National Reference Centre for Orphan Diseases, Narcolepsy, Idiopathic Hypersomnia, and Kleine-Levin Syndrome, Montpellier, France__
___
**CONTENT:** 
- **MAIN.m** contains the main commented code that guides the user through the correct reproduction of the results
- **data.mat** is the anonymised raw data of actigraphy and concomittant polysomnography (PSG). PSG and actigraphy were pre-processed to have the following structure:  
  - "data" is a cells array, where each cell corresponding to one subject    
  - each cell is a structure array containing the following fields:   
        - time:   Nx1 vector, _hh:mm:ss_, continuing past midnight without resetting to 0, for example, 1:00 AM would be 25:00:00, and so on  
        - act:    Nx1 vector, activity counts at each timestep  
        - hypno:  Nx1 vector, sleep stage at each timestep: 1 = wake, 2 = REM sleep, 3 = N1, 4 = N2, 5 = N3  
        - pred_aw:Nx1 vector, predictions from ActiWatch2, 1 = wake, 0 = sleep  
      where N is the number of 30-seconds epochs in the whole recording (32hours)  
- **cohensKappa.m** and spider_plot.m are two additionnal functions required for the proper running of the MAIN code, not developed by me, see:  
       - https://fr.mathworks.com/matlabcentral/fileexchange/69943-simple-cohen-s-kappa  
       - https://fr.mathworks.com/matlabcentral/fileexchange/59561-spider_plot  
- **full_mdl.mat** is the pre-trained complete model, in case users wish to use it on their own data without having to run the whole training again  

The code was run with the following Matlab configuration 

MATLAB Version: 9.10.0.1602886 (R2021a)  
MATLAB License Number: 968398  
Operating System: Microsoft Windows 10 Professionnel Version 10.0 (Build 19045)  
Java Version: Java 1.8.0_202-b08 with Oracle Corporation Jave HotSpot(TM) 64-Bit Server VM mixed mode  

-----------------------------------------------------------------------------------------------------
MATLAB &nbsp;&nbsp;&nbsp;                             Version 9.10        (R2021a)  
Simulink    &nbsp;&nbsp;&nbsp;                                           Version 10.3  &nbsp;&nbsp;&nbsp;       (R2021a)  
5G Toolbox  &nbsp;&nbsp;&nbsp;                                           Version 2.2   &nbsp;&nbsp;&nbsp;       (R2021a)  
AUTOSAR Blockset    &nbsp;&nbsp;&nbsp;                                   Version 2.4   &nbsp;&nbsp;&nbsp;       (R2021a)  
Aerospace Blockset  &nbsp;&nbsp;&nbsp;                                   Version 5.0   &nbsp;&nbsp;&nbsp;       (R2021a)  
Aerospace Toolbox   &nbsp;&nbsp;&nbsp;                                   Version 4.0   &nbsp;&nbsp;&nbsp;       (R2021a)  
Antenna Toolbox     &nbsp;&nbsp;&nbsp;                                   Version 5.0   &nbsp;&nbsp;&nbsp;       (R2021a)  
Audio Toolbox       &nbsp;&nbsp;&nbsp;                                   Version 3.0   &nbsp;&nbsp;&nbsp;       (R2021a)  
Automated Driving Toolbox       &nbsp;&nbsp;&nbsp;                       Version 3.3         &nbsp;&nbsp;&nbsp; (R2021a)  
Bioinformatics Toolbox         &nbsp;&nbsp;&nbsp;                        Version 4.15.1      &nbsp;&nbsp;&nbsp; (R2021a)  
Communications Toolbox         &nbsp;&nbsp;&nbsp;                        Version 7.5         &nbsp;&nbsp;&nbsp; (R2021a)  
Computer Vision Toolbox        &nbsp;&nbsp;&nbsp;                        Version 10.0        &nbsp;&nbsp;&nbsp; (R2021a)  
Control System Toolbox         &nbsp;&nbsp;&nbsp;                        Version 10.10       &nbsp;&nbsp;&nbsp; (R2021a)  
Curve Fitting Toolbox          &nbsp;&nbsp;&nbsp;                        Version 3.5.13      &nbsp;&nbsp;&nbsp; (R2021a)  
DDS Blockset                   &nbsp;&nbsp;&nbsp;                        Version 1.0         &nbsp;&nbsp;&nbsp; (R2021a)  
DO Qualification Kit           &nbsp;&nbsp;&nbsp;                        Version 3.11        &nbsp;&nbsp;&nbsp; (R2021a)  
DSP System Toolbox             &nbsp;&nbsp;&nbsp;                        Version 9.12        &nbsp;&nbsp;&nbsp; (R2021a)  
Data Acquisition Toolbox       &nbsp;&nbsp;&nbsp;                        Version 4.3         &nbsp;&nbsp;&nbsp; (R2021a)  
Database Toolbox               &nbsp;&nbsp;&nbsp;                        Version 10.1        &nbsp;&nbsp;&nbsp; (R2021a)  
Datafeed Toolbox               &nbsp;&nbsp;&nbsp;                        Version 6.0         &nbsp;&nbsp;&nbsp; (R2021a)  
Deep Learning HDL Toolbox      &nbsp;&nbsp;&nbsp;                        Version 1.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Deep Learning Toolbox          &nbsp;&nbsp;&nbsp;                        Version 14.2        &nbsp;&nbsp;&nbsp; (R2021a)  
Econometrics Toolbox           &nbsp;&nbsp;&nbsp;                        Version 5.6         &nbsp;&nbsp;&nbsp; (R2021a)  
Embedded Coder                 &nbsp;&nbsp;&nbsp;                        Version 7.6         &nbsp;&nbsp;&nbsp; (R2021a)  
Filter Design HDL Coder        &nbsp;&nbsp;&nbsp;                        Version 3.1.9       &nbsp;&nbsp;&nbsp; (R2021a)  
Financial Instruments Toolbox  &nbsp;&nbsp;&nbsp;                        Version 3.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Financial Toolbox              &nbsp;&nbsp;&nbsp;                        Version 6.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Fixed-Point Designer           &nbsp;&nbsp;&nbsp;                        Version 7.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Fuzzy Logic Toolbox           &nbsp;&nbsp;&nbsp;                         Version 2.8.1       &nbsp;&nbsp;&nbsp; (R2021a)  
GPU Coder                     &nbsp;&nbsp;&nbsp;                         Version 2.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Global Optimization Toolbox   &nbsp;&nbsp;&nbsp;                         Version 4.5         &nbsp;&nbsp;&nbsp; (R2021a)  
HDL Coder                     &nbsp;&nbsp;&nbsp;                         Version 3.18        &nbsp;&nbsp;&nbsp; (R2021a)  
HDL Verifier                  &nbsp;&nbsp;&nbsp;                         Version 6.3         &nbsp;&nbsp;&nbsp; (R2021a)  
IEC Certification Kit         &nbsp;&nbsp;&nbsp;                         Version 3.17        &nbsp;&nbsp;&nbsp; (R2021a)  
Image Acquisition Toolbox     &nbsp;&nbsp;&nbsp;                         Version 6.4         &nbsp;&nbsp;&nbsp; (R2021a)  
Image Processing Toolbox      &nbsp;&nbsp;&nbsp;                         Version 11.3        &nbsp;&nbsp;&nbsp; (R2021a)  
Instrument Control Toolbox    &nbsp;&nbsp;&nbsp;                         Version 4.4         &nbsp;&nbsp;&nbsp; (R2021a)  
LTE Toolbox                  &nbsp;&nbsp;&nbsp;                          Version 3.5         &nbsp;&nbsp;&nbsp; (R2021a)  
Lidar Toolbox                &nbsp;&nbsp;&nbsp;                          Version 1.1         &nbsp;&nbsp;&nbsp; (R2021a)  
MATLAB Coder                 &nbsp;&nbsp;&nbsp;                          Version 5.2         &nbsp;&nbsp;&nbsp; (R2021a)  
MATLAB Compiler               &nbsp;&nbsp;&nbsp;                         Version 8.2         &nbsp;&nbsp;&nbsp; (R2021a)  
MATLAB Compiler SDK           &nbsp;&nbsp;&nbsp;                         Version 6.10        &nbsp;&nbsp;&nbsp; (R2021a)  
MATLAB Parallel Server        &nbsp;&nbsp;&nbsp;                         Version 7.4         &nbsp;&nbsp;&nbsp; (R2021a)  
MATLAB Report Generator       &nbsp;&nbsp;&nbsp;                         Version 5.10        &nbsp;&nbsp;&nbsp; (R2021a)  
Mapping Toolbox               &nbsp;&nbsp;&nbsp;                         Version 5.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Mixed-Signal Blockset         &nbsp;&nbsp;&nbsp;                         Version 2.0         &nbsp;&nbsp;&nbsp; (R2021a)  
Model Predictive Control Toolbox    &nbsp;&nbsp;&nbsp;                   Version 7.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Model-Based Calibration Toolbox     &nbsp;&nbsp;&nbsp;                   Version 5.10        &nbsp;&nbsp;&nbsp; (R2021a)  
Motor Control Blockset              &nbsp;&nbsp;&nbsp;                   Version 1.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Navigation Toolbox                  &nbsp;&nbsp;&nbsp;                   Version 2.0         &nbsp;&nbsp;&nbsp; (R2021a)  
OPC Toolbox                         &nbsp;&nbsp;&nbsp;                   Version 5.0.2       &nbsp;&nbsp;&nbsp; (R2021a)  
Optimization Toolbox                &nbsp;&nbsp;&nbsp;                   Version 9.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Parallel Computing Toolbox          &nbsp;&nbsp;&nbsp;                   Version 7.4         &nbsp;&nbsp;&nbsp; (R2021a)  
Partial Differential Equation Toolbox &nbsp;&nbsp;&nbsp;                 Version 3.6         &nbsp;&nbsp;&nbsp; (R2021a)  
Phased Array System Toolbox           &nbsp;&nbsp;&nbsp;                 Version 4.5         &nbsp;&nbsp;&nbsp; (R2021a)  
Polyspace Bug Finder                  &nbsp;&nbsp;&nbsp;                 Version 3.4         &nbsp;&nbsp;&nbsp; (R2021a)  
Polyspace Bug Finder Server           &nbsp;&nbsp;&nbsp;                 Version 3.4         &nbsp;&nbsp;&nbsp; (R2021a)  
Polyspace Code Prover                 &nbsp;&nbsp;&nbsp;                 Version 10.4        &nbsp;&nbsp;&nbsp; (R2021a)  
Polyspace Code Prover Server          &nbsp;&nbsp;&nbsp;                 Version 10.4        &nbsp;&nbsp;&nbsp; (R2021a)  
Powertrain Blockset                   &nbsp;&nbsp;&nbsp;                 Version 1.9         &nbsp;&nbsp;&nbsp; (R2021a)  
Predictive Maintenance Toolbox        &nbsp;&nbsp;&nbsp;                 Version 2.3         &nbsp;&nbsp;&nbsp; (R2021a)  
RF Blockset                           &nbsp;&nbsp;&nbsp;                 Version 8.1         &nbsp;&nbsp;&nbsp; (R2021a)  
RF Toolbox                            &nbsp;&nbsp;&nbsp;                 Version 4.1         &nbsp;&nbsp;&nbsp; (R2021a)  
ROS Toolbox                           &nbsp;&nbsp;&nbsp;                 Version 1.3         &nbsp;&nbsp;&nbsp; (R2021a)  
Radar Toolbox                         &nbsp;&nbsp;&nbsp;                 Version 1.0         &nbsp;&nbsp;&nbsp; (R2021a)  
Reinforcement Learning Toolbox        &nbsp;&nbsp;&nbsp;                 Version 2.0         &nbsp;&nbsp;&nbsp; (R2021a)  
Risk Management Toolbox               &nbsp;&nbsp;&nbsp;                 Version 1.9         &nbsp;&nbsp;&nbsp; (R2021a)  
Robotics System Toolbox               &nbsp;&nbsp;&nbsp;                 Version 3.3         &nbsp;&nbsp;&nbsp; (R2021a)  
Robust Control Toolbox                &nbsp;&nbsp;&nbsp;                 Version 6.10        &nbsp;&nbsp;&nbsp; (R2021a)  
Satellite Communications Toolbox      &nbsp;&nbsp;&nbsp;                 Version 1.0         &nbsp;&nbsp;&nbsp; (R2021a)  
Sensor Fusion and Tracking Toolbox    &nbsp;&nbsp;&nbsp;                 Version 2.1         &nbsp;&nbsp;&nbsp; (R2021a)  
SerDes Toolbox                        &nbsp;&nbsp;&nbsp;                 Version 2.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Signal Processing Toolbox             &nbsp;&nbsp;&nbsp;                 Version 8.6         &nbsp;&nbsp;&nbsp; (R2021a)  
SimBiology                            &nbsp;&nbsp;&nbsp;                 Version 6.1         &nbsp;&nbsp;&nbsp; (R2021a)  
SimEvents                             &nbsp;&nbsp;&nbsp;                 Version 5.10        &nbsp;&nbsp;&nbsp; (R2021a)  
Simscape                              &nbsp;&nbsp;&nbsp;                 Version 5.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Simscape Driveline                    &nbsp;&nbsp;&nbsp;                 Version 3.3         &nbsp;&nbsp;&nbsp; (R2021a)  
Simscape Electrical                   &nbsp;&nbsp;&nbsp;                 Version 7.5         &nbsp;&nbsp;&nbsp; (R2021a)  
Simscape Fluids                       &nbsp;&nbsp;&nbsp;                 Version 3.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Simscape Multibody                    &nbsp;&nbsp;&nbsp;                 Version 7.3         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink 3D Animation                 &nbsp;&nbsp;&nbsp;                 Version 9.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Check                        &nbsp;&nbsp;&nbsp;                 Version 5.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Code Inspector               &nbsp;&nbsp;&nbsp;                 Version 3.8         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Coder                        &nbsp;&nbsp;&nbsp;                 Version 9.5         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Compiler                     &nbsp;&nbsp;&nbsp;                 Version 1.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Control Design               &nbsp;&nbsp;&nbsp;                 Version 5.7         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Coverage                     &nbsp;&nbsp;&nbsp;                 Version 5.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Design Optimization          &nbsp;&nbsp;&nbsp;                 Version 3.9.1       &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Design Verifier              &nbsp;&nbsp;&nbsp;                 Version 4.5         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Desktop Real-Time            &nbsp;&nbsp;&nbsp;                 Version 5.12        &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink PLC Coder                    &nbsp;&nbsp;&nbsp;                 Version 3.4         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Real-Time                    &nbsp;&nbsp;&nbsp;                 Version 7.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Report Generator             &nbsp;&nbsp;&nbsp;                 Version 5.10        &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Requirements                 &nbsp;&nbsp;&nbsp;                 Version 1.7         &nbsp;&nbsp;&nbsp; (R2021a)  
Simulink Test                         &nbsp;&nbsp;&nbsp;                 Version 3.4         &nbsp;&nbsp;&nbsp; (R2021a)  
SoC Blockset                          &nbsp;&nbsp;&nbsp;                 Version 1.4         &nbsp;&nbsp;&nbsp; (R2021a)  
Spreadsheet Link                      &nbsp;&nbsp;&nbsp;                 Version 3.4.5       &nbsp;&nbsp;&nbsp; (R2021a)  
Stateflow                             &nbsp;&nbsp;&nbsp;                 Version 10.4        &nbsp;&nbsp;&nbsp; (R2021a)  
Statistics and Machine Learning Toolbox &nbsp;&nbsp;&nbsp;               Version 12.1        &nbsp;&nbsp;&nbsp; (R2021a)  
Symbolic Math Toolbox                   &nbsp;&nbsp;&nbsp;               Version 8.7         &nbsp;&nbsp;&nbsp; (R2021a)  
System Composer                         &nbsp;&nbsp;&nbsp;               Version 2.0         &nbsp;&nbsp;&nbsp; (R2021a)  
System Identification Toolbox           &nbsp;&nbsp;&nbsp;               Version 9.14        &nbsp;&nbsp;&nbsp; (R2021a)  
Text Analytics Toolbox                  &nbsp;&nbsp;&nbsp;               Version 1.7         &nbsp;&nbsp;&nbsp; (R2021a)  
UAV Toolbox                             &nbsp;&nbsp;&nbsp;               Version 1.1         &nbsp;&nbsp;&nbsp; (R2021a)  
Vehicle Dynamics Blockset               &nbsp;&nbsp;&nbsp;               Version 1.6         &nbsp;&nbsp;&nbsp; (R2021a)  
Vehicle Network Toolbox                &nbsp;&nbsp;&nbsp;                Version 5.0         &nbsp;&nbsp;&nbsp; (R2021a)  
Vision HDL Toolbox                     &nbsp;&nbsp;&nbsp;                Version 2.3         &nbsp;&nbsp;&nbsp; (R2021a)  
WLAN Toolbox                           &nbsp;&nbsp;&nbsp;                Version 3.2         &nbsp;&nbsp;&nbsp; (R2021a)  
Wavelet Toolbox                        &nbsp;&nbsp;&nbsp;                Version 5.6         &nbsp;&nbsp;&nbsp; (R2021a)  
Wireless HDL Toolbox                   &nbsp;&nbsp;&nbsp;                Version 2.2    


___
**MAIN.m** contains 6 blocks: 
- Blocks 1-5 are aimed are reproducing the findings from the article
- Block 6 allows the user to predict sleep/wake on their own data, this block may be used independently from the others, in that case the user needs to load the already-trained model "full_mdl" in the workspace before proceeding 

Note that the code includes a random component, and unfortunately no seeding was performed on this account. 
Although the use of bootstraps greatly reduces the impact of randomness on the results, it is unlikely that this pipeline reproduces the exact same results that were reported in the article.
Note that, if the user wants to reproduce the entirety of the results, including the 300-sample bootstraping procedure, the latter may take as long as 2-12 hours depending on the computer specifications.

For any further questions, please contact me at the following:
tugdual.adam@gmail.com

Kindly, Tugdual Adam
