clear; clc;

cd("Z:\git\node2023")

% 데이터 불러오기
data = readtable('seats.csv');

% 날짜와 시간을 datetime 객체로 변환
datetimes = datetime(data.Timestamp, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z');

% 각 날짜 및 시간 구성 요소 추출
years = year(datetimes);
months = month(datetimes);
days = day(datetimes);
hours = hour(datetimes);
minutes = minute(datetimes);
seconds = second(datetimes);

%%

clear; clc;

% 데이터 불러오기
data = readtable('seats.csv');

% 날짜와 시간을 datetime 객체로 변환
datetimes = datetime(data.Timestamp, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z');

% 각 열에 대한 변수 생성
DB1_max = data.x0Decibel1Max;
DB1_current = data.x0Decibel1Current;
DB2_max = data.x0Decibel2Max;
DB2_current = data.x0Decibel2Current;
ZONE1_max = data.x0Zone1Max;
ZONE1_current = data.x0Zone1Current;
ZONE2_max = data.x0Zone2Max;
ZONE2_current = data.x0Zone2Current;
Laptop_max = data.LaptopZoneMax;
Laptop_current = data.LaptopZoneCurrent;

% 데이터 시각화
figure;

subplot(5, 2, 1);
plot(datetimes, DB1_current,"LineWidth",5);
title('0 데시벨 1 (점유좌석수)');
%xlabel('Timestamp');
ylabel('점유좌석');
grid on;

subplot(5, 2, 2);
plot(datetimes, DB1_current./DB1_max*100,"LineWidth",5);
title('0 데시벨 1 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;

subplot(5, 2, 3);
plot(datetimes, DB2_current,"LineWidth",5);
title('0 데시벨 2');
%xlabel('Timestamp');
ylabel('점유좌석');
grid on;

subplot(5, 2, 4);
plot(datetimes, DB2_current./DB2_max*100,"LineWidth",5);
title('0 데시벨 2 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;

subplot(5, 2, 5);
plot(datetimes, ZONE1_current,"LineWidth",5);
title('0 Zone 1');
%xlabel('Timestamp');
ylabel('점유좌석');
grid on;

subplot(5, 2, 6);
plot(datetimes, ZONE1_current./ZONE1_max*100,"LineWidth",5);
title('0 Zone 1 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;

subplot(5, 2, 7);
plot(datetimes, ZONE2_current,"LineWidth",5);
title('0 Zone 2');
%xlabel('Timestamp');
ylabel('점유좌석');
grid on;

subplot(5, 2, 8);
plot(datetimes, ZONE2_current./ZONE2_max*100,"LineWidth",5);
title('0 Zone 2 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;

subplot(5, 2, 9);
plot(datetimes, Laptop_current,"LineWidth",5);
title('노트북실');
%xlabel('Timestamp');
ylabel('점유좌석');
grid on;

subplot(5, 2, 10);
plot(datetimes, Laptop_current./Laptop_max*100,"LineWidth",5);
title('노트북실 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;

%%

clear; clc;

% 데이터 불러오기
data = readtable('seats.csv');

% 날짜와 시간을 datetime 객체로 변환
datetimes = datetime(data.Timestamp, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z');

% 각 열에 대한 변수 생성
DB1_max = data.x0Decibel1Max;
DB1_current = data.x0Decibel1Current;
DB2_max = data.x0Decibel2Max;
DB2_current = data.x0Decibel2Current;
ZONE1_max = data.x0Zone1Max;
ZONE1_current = data.x0Zone1Current;
ZONE2_max = data.x0Zone2Max;
ZONE2_current = data.x0Zone2Current;
Laptop_max = data.LaptopZoneMax;
Laptop_current = data.LaptopZoneCurrent;

% 데이터 시각화
figure;

plot(datetimes, DB1_current./DB1_max*100, "LineWidth", 2, 'DisplayName', '0 데시벨 1',"LineWidth",5);
hold on;
plot(datetimes, DB2_current./DB2_max*100, "LineWidth", 2, 'DisplayName', '0 데시벨 2',"LineWidth",5);
plot(datetimes, ZONE1_current./ZONE1_max*100, "LineWidth", 2, 'DisplayName', '0 Zone 1',"LineWidth",5);
plot(datetimes, ZONE2_current./ZONE2_max*100, "LineWidth", 2, 'DisplayName', '0 Zone 2',"LineWidth",5);
plot(datetimes, Laptop_current./Laptop_max*100, "LineWidth", 2, 'DisplayName', '노트북실',"LineWidth",5);

title('좌석 점유율 [%]');
xlabel('Timestamp');
ylabel('점유율 [%]');
legend('show');
grid on;

%%

clear; clc;

subplot_num = 6;

% 데이터 불러오기
data = readtable('seats.csv');

% 날짜와 시간을 datetime 객체로 변환
datetimes = datetime(data.Timestamp, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z');

% 각 열에 대한 변수 생성
DB1_max = data.x0Decibel1Max;
DB1_current = data.x0Decibel1Current;
DB2_max = data.x0Decibel2Max;
DB2_current = data.x0Decibel2Current;
ZONE1_max = data.x0Zone1Max;
ZONE1_current = data.x0Zone1Current;
ZONE2_max = data.x0Zone2Max;
ZONE2_current = data.x0Zone2Current;
Laptop_max = data.LaptopZoneMax;
Laptop_current = data.LaptopZoneCurrent;

% 데이터 시각화
figure;

subplot(subplot_num, 1, 1);
plot(datetimes, DB1_current./DB1_max*100,"LineWidth",5);
title('0 데시벨 1 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;
axis tight;

subplot(subplot_num, 1, 2);
plot(datetimes, DB2_current./DB2_max*100,"LineWidth",5);
title('0 데시벨 2 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;
axis tight;

subplot(subplot_num, 1, 3);
plot(datetimes, ZONE1_current./ZONE1_max*100,"LineWidth",5);
title('0 Zone 1 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;
axis tight;

subplot(subplot_num, 1, 4);
plot(datetimes, ZONE2_current./ZONE2_max*100,"LineWidth",5);
title('0 Zone 2 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;
axis tight;

subplot(subplot_num, 1, 5);
plot(datetimes, Laptop_current./Laptop_max*100,"LineWidth",5);
title('노트북실 (좌석점유율 [%])');
%xlabel('Timestamp');
ylabel('점유율 [%]');
grid on;
axis tight;

total = DB1_current + DB2_current + ZONE1_current + ZONE2_current + Laptop_current;
subplot(subplot_num, 1, 6);
plot(datetimes, total,"LineWidth",5);
title('도서관 학생 수');
%xlabel('Timestamp');
ylabel('학생수');
grid on;
axis tight;

%%
clear; clc;

subplot_num = 6;

% 데이터 불러오기
opts = detectImportOptions('seats.csv');
opts = setvaropts(opts, 'Timestamp', 'Type', 'char');
data = readtable('seats.csv', opts);


% 날짜와 시간을 datetime 객체로 변환
timestamps = strrep(data.Timestamp, ' 24:', ' 00:');
timestamps = strrep(timestamps, '.', '');

datetimes = datetime(timestamps, 'InputFormat', 'yyyy MM dd HH:mm:ss');



% 각 열에 대한 변수 생성
DB1_max = data.x0Decibel1Max;
DB1_current = data.x0Decibel1Current;
DB2_max = data.x0Decibel2Max;
DB2_current = data.x0Decibel2Current;
ZONE1_max = data.x0Zone1Max;
ZONE1_current = data.x0Zone1Current;
ZONE2_max = data.x0Zone2Max;
ZONE2_current = data.x0Zone2Current;
Laptop_max = data.LaptopZoneMax;
Laptop_current = data.LaptopZoneCurrent;

% 데이터 시각화
figure;

% x축 날짜 및 시간 눈금 설정
%xticks_start = dateshift(min(datetimes), 'start', 'day');
%xticks_end = dateshift(max(datetimes), 'end', 'day');
%xticks_range = xticks_start:hours(2):xticks_end;

for i = 1:subplot_num
    subplot(subplot_num, 1, i);
    switch i
        case 1
            plot(datetimes, DB1_current./DB1_max*100,"LineWidth",5);
            title('0 데시벨 1 (좌석점유율 [%])');
        case 2
            plot(datetimes, DB2_current./DB2_max*100,"LineWidth",5);
            title('0 데시벨 2 (좌석점유율 [%])');
        case 3
            plot(datetimes, ZONE1_current./ZONE1_max*100,"LineWidth",5);
            title('0 Zone 1 (좌석점유율 [%])');
        case 4
            plot(datetimes, ZONE2_current./ZONE2_max*100,"LineWidth",5);
            title('0 Zone 2 (좌석점유율 [%])');
        case 5
            plot(datetimes, Laptop_current./Laptop_max*100,"LineWidth",5);
            title('노트북실 (좌석점유율 [%])');
        case 6
            total = DB1_current + DB2_current + ZONE1_current + ZONE2_current + Laptop_current;
            plot(datetimes, total,"LineWidth",5);
            title('도서관 학생 수');
    end
    ylabel('점유율 [%]');
    grid on;
    axis tight;
    %set(gca, 'XTick', xticks_range);
    %datetick('x', 'HH:MM', 'keepticks');
    %xlim([xticks_start, xticks_end]);
end

ylabel('학생 수');

