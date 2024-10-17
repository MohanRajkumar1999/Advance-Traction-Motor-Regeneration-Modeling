%%post processing
data = readmatrix('NissanLeafMC-230127-135032.csv');
MS = data(:,1);
MPT = data(:,2);
MCT = data(:,3);
%% Motor operating points without control logic
figure('Name','Motor operating points without control logic')
scatter(out.Motor_R_S.data,abs(out.Motor_R_T.data))
xlabel('Motor speed(rpm)')
ylabel('Motor Torque (Nm)')
title('Motor operating points without control logic')
hold on
plot(MS,MPT,'r');
text(1000,max(MPT)+5,'Motor Peak Torque')
plot(MS,MCT,'g');
text(1000,max(MCT)+5,'Motor Continuous Torque')

%% Motor operating points with control logic
figure('Name','Motor operating points with control logic')
scatter(out.Motor_RC_S.data,abs(out.Motor_RC_T.data))
xlabel('Motor speed(rpm)')
ylabel('Motor Torque (Nm)')
title('Motor operating points with control logic')
hold on
plot(MS,MPT,'r');
text(1000,max(MPT)+5,'Motor Peak Torque')
plot(MS,MCT,'g');
text(1000,max(MCT)+5,'Motor Continuous Torque')
%% Wheel to well analysis
figure('Name','Wheel to well analysis of regenerative energy')
W_w = [abs(out.Wheel_RE.Data(end)),abs(out.Transmission_RE.Data(end)),abs(out.Motor_RE.Data(end)),abs(out.Motor_C_RE.Data(end)),abs(out.Battery_RE.Data(end))];
bar(W_w)
set(gca,'xtickLabel',{'Wheel','Transmission','Motor','Motor Controller','Battery'},'XTickLabelRotation',45)
xlabel('Subsytem')
ylabel('Regenerative Energy(Wh)')
title('Wheel to well analysis of regenerative energy')

%% Wheel to well in percentage
figure('Name','Wheel to well in percentage')
E_Percentage = [(abs(out.Wheel_RE.Data(end))/abs(out.Wheel_RE.Data(end)))*100,(abs(out.Transmission_RE.Data(end))/abs(out.Wheel_RE.Data(end)))*100,(abs(out.Motor_RE.Data(end))/abs(out.Wheel_RE.Data(end)))*100,(abs(out.Motor_C_RE.Data(end))/abs(out.Wheel_RE.Data(end)))*100,(abs(out.Battery_RE.Data(end))/abs(out.Wheel_RE.Data(end)))*100]
plot(E_Percentage)
set(gca,'xtickLabel',{'Wheel','Transmission','Motor','Motor Controller','Battery'},'XTickLabelRotation',45)
xlabel('Subsytem')
ylabel('Regenerative Energy(%)')
title('Wheel to well in percentage')

