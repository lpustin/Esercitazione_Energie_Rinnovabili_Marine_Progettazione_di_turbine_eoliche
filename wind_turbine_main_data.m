clear; clc; close all;

%% Gearbox and generator data
GBRatio = 97; %[-] Gearbox ratio
GBEff = 1.00; %[-] Gearbox efficiency

GenEff = 0.944; %[-] Generator efficiency
GenIner=534.116; %[kg m2]


%% Blade data

% distributed properties

% BlFract - Blade fractional radius for distributed input data [-].
% PitchAxis - Pitch axis for distributed input data [-].
% StrcTwst - Structural twist for distributed input data [radians].
% BMassDen - Blade mass density for distributed input data [-].
% FlpStff - Blade flap stiffness for distributed input data [-].
% EdgStff - Blade edge stiffness for distributed input data [-].

% ---------------------- DISTRIBUTED BLADE PROPERTIES ----------------------------
%     BlFract      PitchAxis      StrcTwst       BMassDen        FlpStff        EdgStff
%       (-)           (-)          (deg)          (kg/m)         (Nm^2)         (Nm^2)
Blade_props=[...
0.0000000E+00  2.5000000E-01  1.3308000E+01  6.7893500E+02  1.8110000E+10  1.8113600E+10
3.2500000E-03  2.5000000E-01  1.3308000E+01  6.7893500E+02  1.8110000E+10  1.8113600E+10
1.9510000E-02  2.5049000E-01  1.3308000E+01  7.7336300E+02  1.9424900E+10  1.9558600E+10
3.5770000E-02  2.5490000E-01  1.3308000E+01  7.4055000E+02  1.7455900E+10  1.9497800E+10
5.2030000E-02  2.6716000E-01  1.3308000E+01  7.4004200E+02  1.5287400E+10  1.9788800E+10
6.8290000E-02  2.7941000E-01  1.3308000E+01  5.9249600E+02  1.0782400E+10  1.4858500E+10
8.4550000E-02  2.9167000E-01  1.3308000E+01  4.5027500E+02  7.2297200E+09  1.0220600E+10
1.0081000E-01  3.0392000E-01  1.3308000E+01  4.2405400E+02  6.3095400E+09  9.1447000E+09
1.1707000E-01  3.1618000E-01  1.3308000E+01  4.0063800E+02  5.5283600E+09  8.0631600E+09
1.3335000E-01  3.2844000E-01  1.3308000E+01  3.8206200E+02  4.9800600E+09  6.8844400E+09
1.4959000E-01  3.4069000E-01  1.3308000E+01  3.9965500E+02  4.9368400E+09  7.0091800E+09
1.6585000E-01  3.5294000E-01  1.3308000E+01  4.2632100E+02  4.6916600E+09  7.1676800E+09
1.8211000E-01  3.6519000E-01  1.3181000E+01  4.1682000E+02  3.9494600E+09  7.2716600E+09
1.9837000E-01  3.7500000E-01  1.2848000E+01  4.0618600E+02  3.3865200E+09  7.0817000E+09
2.1465000E-01  3.7500000E-01  1.2192000E+01  3.8142000E+02  2.9337400E+09  6.2445300E+09
2.3089000E-01  3.7500000E-01  1.1561000E+01  3.5282200E+02  2.5689600E+09  5.0489600E+09
2.4715000E-01  3.7500000E-01  1.1072000E+01  3.4947700E+02  2.3886500E+09  4.9484900E+09
2.6341000E-01  3.7500000E-01  1.0792000E+01  3.4653800E+02  2.2719900E+09  4.8080200E+09
2.9595000E-01  3.7500000E-01  1.0232000E+01  3.3933300E+02  2.0500500E+09  4.5014000E+09
3.2846000E-01  3.7500000E-01  9.6720000E+00  3.3000400E+02  1.8282500E+09  4.2440700E+09
3.6098000E-01  3.7500000E-01  9.1100000E+00  3.2199000E+02  1.5887100E+09  3.9952800E+09
3.9350000E-01  3.7500000E-01  8.5340000E+00  3.1382000E+02  1.3619300E+09  3.7507600E+09
4.2602000E-01  3.7500000E-01  7.9320000E+00  2.9473400E+02  1.1023800E+09  3.4471400E+09
4.5855000E-01  3.7500000E-01  7.3210000E+00  2.8712000E+02  8.7580000E+08  3.1390700E+09
4.9106000E-01  3.7500000E-01  6.7110000E+00  2.6334300E+02  6.8130000E+08  2.7342400E+09
5.2358000E-01  3.7500000E-01  6.1220000E+00  2.5320700E+02  5.3472000E+08  2.5548700E+09
5.5610000E-01  3.7500000E-01  5.5460000E+00  2.4166600E+02  4.0890000E+08  2.3340300E+09
5.8862000E-01  3.7500000E-01  4.9710000E+00  2.2063800E+02  3.1454000E+08  1.8287300E+09
6.2115000E-01  3.7500000E-01  4.4010000E+00  2.0029300E+02  2.3863000E+08  1.5841000E+09
6.5366000E-01  3.7500000E-01  3.8340000E+00  1.7940400E+02  1.7588000E+08  1.3233600E+09
6.8618000E-01  3.7500000E-01  3.3320000E+00  1.6509400E+02  1.2601000E+08  1.1836800E+09
7.1870000E-01  3.7500000E-01  2.8900000E+00  1.5441100E+02  1.0726000E+08  1.0201600E+09
7.5122000E-01  3.7500000E-01  2.5030000E+00  1.3893500E+02  9.0880000E+07  7.9781000E+08
7.8376000E-01  3.7500000E-01  2.1160000E+00  1.2955500E+02  7.6310000E+07  7.0961000E+08
8.1626000E-01  3.7500000E-01  1.7300000E+00  1.0726400E+02  6.1050000E+07  5.1819000E+08
8.4878000E-01  3.7500000E-01  1.3420000E+00  9.8776000E+01  4.9480000E+07  4.5487000E+08
8.8130000E-01  3.7500000E-01  9.5400000E-01  9.0248000E+01  3.9360000E+07  3.9512000E+08
8.9756000E-01  3.7500000E-01  7.6000000E-01  8.3001000E+01  3.4670000E+07  3.5372000E+08
9.1382000E-01  3.7500000E-01  5.7400000E-01  7.2906000E+01  3.0410000E+07  3.0473000E+08
9.3008000E-01  3.7500000E-01  4.0400000E-01  6.8772000E+01  2.6520000E+07  2.8142000E+08
9.3821000E-01  3.7500000E-01  3.1900000E-01  6.6264000E+01  2.3840000E+07  2.6171000E+08
9.4636000E-01  3.7500000E-01  2.5300000E-01  5.9340000E+01  1.9630000E+07  1.5881000E+08
9.5447000E-01  3.7500000E-01  2.1600000E-01  5.5914000E+01  1.6000000E+07  1.3788000E+08
9.6260000E-01  3.7500000E-01  1.7800000E-01  5.2484000E+01  1.2830000E+07  1.1879000E+08
9.7073000E-01  3.7500000E-01  1.4000000E-01  4.9114000E+01  1.0080000E+07  1.0163000E+08
9.7886000E-01  3.7500000E-01  1.0100000E-01  4.5818000E+01  7.5500000E+06  8.5070000E+07
9.8699000E-01  3.7500000E-01  6.2000000E-02  4.1669000E+01  4.6000000E+06  6.4260000E+07
9.9512000E-01  3.7500000E-01  2.3000000E-02  1.1453000E+01  2.5000000E+05  6.6100000E+06
1.0000000E+00  3.7500000E-01  0.0000000E+00  1.0319000E+01  1.7000000E+05  5.0100000E+06  ];


%integrated blade properties

R_bl=63; % [m] Blade radius: The distance from the rotor apex to the blade tip
R_hub=1.5; %[m] Hub radius: The distance from the rotor apex to the blade root

r_blade=R_hub+Blade_props(:,1)*(R_bl-R_hub); %[m] Blade radius vector
J_rot_blade=trapz(r_blade,Blade_props(:,4).*r_blade.^2); %[kg m2] blade polar inertia 



