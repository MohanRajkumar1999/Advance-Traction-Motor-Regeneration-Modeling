%Importing the drive cycle
Drive = readmatrix('UDDS.csv');
Drive_Con = readmatrix('UDDS_con-210209-091425.csv');
%Vehicle
%Vehicle mass
Mv = 1630.665; %kg
%Mass of drive
Md = 80;
%Gross vehicle mass
GVM = Mv+Md;
%Gravitational constant
g = 9.81;
%Gross vehicle weight
GVW = GVM*g;

%Vehicle Resistive
%Coefficient of rolling resistance
Crf = 0.015;
%Frontal area 
Fa = 3.8056;
%Air denisty
rho = 1.225;
%Drag coefficient
Cd = 0.28;

%Radius of the wheel
Rw = 0.2032;

%Transmission
GR = 7.9377;
Teff = 0.89;

%Motor
%Motor torque constant
Kt = 0.195;%Nm/A
Kemf = 0.238; %Vs/rad
Ra = 0.00567; %ohms
%%Motor Efficiency
data = readmatrix('Nissan Leaf Motor Efficiency.xls');
NL_M.Speed = data(:,1);
NL_M.Torque = data(:,17);
NL_M.Efficiency = data(:,2:16);
%%Motor Regenerative Efficiency
value = readmatrix('Motor Regenerative Efficiency.csv');
NL_RM.Speed = value(:,1);
NL_RM.Torque = value(:,17);
NL_RM.Efficiency = value(:,2:16);
%Motor Controller
%Motoring
value1 = readmatrix('Nissan Leaf Motor Controller Efficiency.csv');
NL_MC.Speed = value1(:,1);
NL_MC.Torque = value1(:,17);
NL_MC.Efficiency = value1(:,2:16);
%Regenerative
value2 = readmatrix('Motor Regenerative Efficiency.csv');
NL_MCR.Speed = value2(:,1);
NL_MCR.Torque = value2(:,17);
NL_MCR.Efficiency = value2(:,2:16);
%%Battery pack
M_R_C = 33.1; %A
%%No of cells in parallel
Np = 2;
%%No of cells in series
Ns = 96;
%%Battery pack interconnection resistance
Ir = 0.0023; %%Ohms
%%Battery pack regenerative limitation
M_B_R_C = M_R_C*Np;
%%Cell terminal voltage
Value3 = readmatrix('Cell Data.csv');
C_V = Value3(:,2);
C_SOC = Value3(:,3);
%%Battery pack capacity
BPC = 66.2; %Ah
%%% Battery pack energy
Battery_E = 24000; %%Wh
%%SOC Limitation
LSOC = 20;
USOC = 80;