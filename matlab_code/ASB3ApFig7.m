%Enforcement Policy in a Theory of Dynamic Deterrence
%ASB3ApFig7.m 
%August 14, 2023, Kenneth I. Carlaw
%DRPpolcost.xlsx contains data generated from modified versions of
%ASB3mainconv.m, ASB3search2Binv.m and ASB3search3Binv.m


%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\kcarlaw\Documents\MATLAB\ASB2022final\DRPpolcost.xlsx
%    Worksheet: Sheet1
%
% Auto-generated by MATLAB on 14-Jun-2022 12:01:36

%% Setup the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 8);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "B2:I28";

% Specify column names and types
opts.VariableNames = ["DRPn","cd1","DRPn2","cd2","eff2","eff6","RC2","RC6"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
tbl = readtable("C:\Users\kcarlaw\Documents\MATLAB\ASB2022final\DRPpolcost.xlsx", opts, "UseExcel", false);

%% Convert to output type
DRPn = tbl.DRPn;
cd1 = tbl.cd1;
DRPn2 = tbl.DRPn2;
cd2 = tbl.cd2;
eff2 = tbl.eff2;
eff6 = tbl.eff6;
RC2 = tbl.RC2;
RC6 = tbl.RC6;

%% Clear temporary variables
clear opts tbl

%% Setup the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 4);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "B2:E11";

% Specify column names and types
opts.VariableNames = ["DROP5","CDRCD","DROP52","CDRCD2"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Import the data
tbl = readtable("C:\Users\kcarlaw\Documents\MATLAB\ASB2022final\DRPpolcost2.xlsx", opts, "UseExcel", false);

%% Convert to output type
DROP = tbl.DROP5;
cd3 = tbl.CDRCD;
DROP2= tbl.DROP52;
cd4 = tbl.CDRCD2;


%% Clear temporary variables
clear opts tbl

reg2=zeros(23,1);
reg2(1)=0.007;
indx=zeros(23,1);
indx(1)=0.35;
for i=2:23
    reg2(i)=(reg2(i-1)+0.246554*.014);
    indx(i)=indx(i-1)+0.015;
end
corcn=corrcoef(DRPn,cd1);
corch=corrcoef(DRPn2,cd2);
coreff2=corrcoef(DRPn,eff2);
coreff6=corrcoef(DRPn2,eff6);
corRC2=corrcoef(DRPn,RC2);
corRC6=corrcoef(DRPn,RC6);

reg=reg2*100;
%figure
%scatter(DRP,cd1*100,'filled','MarkerFaceColor',[0 0 0])
%hold on
%plot(DROP,CDRCD);
%title('Scatter of DROP10 on cost savings')
%xlabel('DROP stat')
%ylabel('cost efficiency of active policy')
%ytickformat('percentage')
%txt={'correlation coef. =' num2str(corc(2,1),'%5.2f')};
%text(.45,14,txt,'HorizontalAlignment','center')
%hold off

figure
tile=tiledlayout(2,2);
tile.Padding='none';
tile.TileSpacing='tight';
nexttile
scatter(DRPn,RC2*100,'filled','MarkerFaceColor',[0 0 0])
hold on
box on
%scatter(DRPn,RC2*100,'filled','s','MarkerFaceColor',[0.5 0.5 0.5]);
%scatter(DROP,cd3*100,'filled','d','MarkerFaceColor',[0.8 0.8 0.8]);
title('Panel 1: reserve capacity as a function of DROP, RAT = 2')
xlabel('DROP')
%ylabel('Cost efficiency of active policy')
ytickformat('percentage')
%yline(0,'LineStyle',':','HandleVisibility','off');
txtn={'Correlation of reserve capacity with DROP',num2str(corRC2(2,1),'%4.2f')};
text(.5,80,txtn,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
%legend('Passive to active (crackdown)','Crackdown to refined crackdown', 'Location','west','FontSize',14)
%legend boxoff
ylim([15 100])
hold off
nexttile
scatter(DRPn,cd1*100,'filled','MarkerFaceColor',[0 0 0])
hold on
box on
scatter(DROP,cd3*100,'filled','d','MarkerFaceColor',[0.8 0.8 0.8]);
title('Panel 2: cost savings as a function of DROP, RAT = 2')
xlabel('DROP')
%ylabel('Cost efficiency of active policy')
ytickformat('percentage')
yline(0,'LineStyle',':','HandleVisibility','off');
txtn={'Correlation of active policy cost saving with DROP',num2str(corcn(2,1),'%4.2f')};
text(.5,12,txtn,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
legend('Passive to active (crackdown)','Crackdown to refined crackdown', 'Location','west','FontSize',14)
legend boxoff
ylim([-2 16])
hold off
%nexttile
%scatter(DRPn,eff2*100,'filled','MarkerFaceColor',[0 0 0])
%hold on
%box on
%title('Panel 3: cost efficiency as a function of DROP, RAT = 2')
%xlabel('DROP')
%ylabel('Cost efficiency of active policy')
%ytickformat('percentage')
%yline(0,'LineStyle',':','HandleVisibility','off');
%ylim([-2 100])
%txtn3={'Correlation of active policy efficiency with DROP',num2str(coreff2(2,1),'%4.2f')};
%text(.5,60,txtn3,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
%txtn={'Correlation of active policy efficiency with DROP, $\frac{(\lambda - 1)}{\rho}$ = 2',num2str(corcn(2,1),'%4.2f')};
%text(.5,12,txtn,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
%legend('Passive to active (crackdown), $\frac{(\lambda - 1)}{\rho}$ = 2','Crackdown to refined crackdown, $\frac{(\lambda - 1)}{\rho}$ = 2', 'Location','west','Interpreter','latex','FontSize',14)
%legend boxoff
%hold off
nexttile
scatter(DRPn,RC6*100,'filled','MarkerFaceColor',[0 0 0])
hold on
box on
%scatter(DRPn,RC2*100,'filled','s','MarkerFaceColor',[0.5 0.5 0.5]);
%scatter(DROP,cd3*100,'filled','d','MarkerFaceColor',[0.8 0.8 0.8]);
title('Panel 4: reserve capacity as a function of DROP, RAT = 6')
xlabel('DROP')
%ylabel('Cost efficiency of active policy')
ytickformat('percentage')
%yline(0,'LineStyle',':','HandleVisibility','off');
txtn={'Correlation of reserve capacity with DROP',num2str(corRC6(2,1),'%4.2f')};
text(.5,80,txtn,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
%legend('Passive to active (crackdown)','Crackdown to refined crackdown', 'Location','west','FontSize',14)
%legend boxoff
ylim([15 100])
hold off
nexttile
scatter(DRPn2,cd2*100,'filled','MarkerFaceColor',[0 0 0])
hold on
box on
scatter(DROP2,cd4*100,'filled','d','MarkerFaceColor',[0.7 0.7 0.7]);
title('Panel 5: cost savings as a function of DROP, RAT = 6')
xlabel('DROP')
%ylabel('Cost efficiency of active policy')
ytickformat('percentage')
yline(0,'LineStyle',':','HandleVisibility','off');
txtn2={'Correlation of active policy cost saving with DROP',num2str(corch(2,1),'%4.2f')};
text(.5,12,txtn2,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
legend('Passive to active (crackdown)', 'Crackdown to refined crackdown','Location','west','FontSize',14)
legend boxoff
ylim([-2 16])
hold off
%nexttile
%scatter(DRPn2,eff6*100,'filled','MarkerFaceColor',[0 0 0])
%hold on
%box on
%scatter(DROP2,cd4*100,'filled','s','MarkerFaceColor',[0.7 0.7 0.7]);
%title('Panel 6: cost efficiency as a function of DROP, RAT = 6')
%xlabel('DROP')
%ylabel('Cost efficiency of active policy')
%ytickformat('percentage')
%yline(0,'LineStyle',':','HandleVisibility','off');
%ylim([-2 100])
%txtn4={'Correlation of active policy efficiency with DROP',num2str(coreff6(2,1),'%4.2f')};
%text(.5,40,txtn4,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
%txtn2={'Correlation of active policy efficiency with DROP, $\frac{(\lambda - 1)}{\rho}$ = 5',num2str(corch(2,1),'%4.2f')};
%text(.5,12,txtn2,'HorizontalAlignment','center','Interpreter','latex','FontSize',12)
%legend('Passive to active (crackdown), $\frac{(\lambda - 1)}{\rho}$ = 5', 'Crackdown to refined crackdown, $\frac{(\lambda - 1)}{\rho}$ = 5','Location','west','Interpreter','latex','FontSize',14)
%legend boxoff
%hold off


%figure
%scatter(DRPh,cd1*100,'filled','MarkerFaceColor',[0 0 0])
%hold on
%plot(indx,reg);
%title('Scatter of DROPh5 on cost savings')
%xlabel('DROP stat')
%ylabel('cost efficiency of active policy')
%ytickformat('percentage')
%txth={'correlation coef. =' num2str(corch(2,1),'%5.2f')};
%text(.35,14,txth,'HorizontalAlignment','center')
%hold off

