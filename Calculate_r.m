% º∆À„Ω≈±æ
clear variables
Co
Li

global Q_Co
global Q_Li
global Co_ii
global Li_ii

options=optimset('algorithm','levenberg-marquardt');
options.MaxFunEvals = 6000;
options.MaxIter = 6000;

for T_i = -20:1:30
Q_Co = QCo(T_i);
Q_Li = QLi(T_i);
x0 = [1.6218    4.9947    4.1147];

x00 = fsolve(@doubleCoLi,x0,options);
Co_i = x00(1);
Li_i = x00(2);
SO4_i = x00(3);

Co_ii_Co = zeros(1,20);
Co_ii_Li = zeros(1,20);
Co_ii_SO4 = zeros(1,20);

for i=1:20
    Co_ii = Co_i * (i-1)/20;
    x = fsolve(@SingleLi,[x0(1),x0(3)],options);
    Co_ii_Co(i) = Co_ii;
    Co_ii_Li(i) = x(1);
    Co_ii_SO4(i) = x(2);
end

Li_ii_Li = zeros(1,20);
Li_ii_Co = zeros(1,20);
Li_ii_SO4 = zeros(1,20);

for j=1:20
    Li_ii = Li_i * (j-1)/20;
    x = fsolve(@SingleCo,[x0(2),x0(3)],options);
    Li_ii_Li(j) = Li_ii;
    Li_ii_Co(j) = x(1);
    Li_ii_SO4(j) = x(2);
end

% figure
% hold on
% plot(Li_ii_Li,Li_ii_Co,'*-')
% plot(Co_ii_Li,Co_ii_Co,'*-')
% plot(x0(2),x0(1),'*')

dataCo = [x00(1),Co_ii_Co,Li_ii_Co] * 154.9968   /9.5;
dataLi = [x00(2),Co_ii_Li,Li_ii_Li] * 109.9456/2 /9.5;

data_M = [dataCo;dataLi];
filename = string(T_i) + '.xls';
xlswrite(filename,data_M)

% figure
% plot(dataCo,dataLi,'*')
% xlabel('Co')
% ylabel('Li')
% title(string(T_i))
end


