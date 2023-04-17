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
Study_hall_max = data.Study_hall_max;
Study_hall_current = data.Study_hall_current;

% 데이터 시각화
figure;

% x축 날짜 및 시간 눈금 설정
%xticks_start = dateshift(min(datetimes), 'start', 'day');
xticks_start = datetimes(1);
%xticks_end = dateshift(max(datetimes), 'end', 'day');
xticks_end = datetimes(end);
xticks_range = xticks_start:hours(2):xticks_end;

% 자정 세로 점선 추가
midnights = dateshift(xticks_start, 'start', 'day'):days(1):xticks_end;

% 정오 중앙 요일 표시
noons = dateshift(xticks_start, 'start', 'day') + hours(12):days(1):xticks_end;


subplot_num = 7;
LineWidth = 5;

for i = 1:subplot_num
    subplot(subplot_num, 1, i);

    Fontsize_title = 20;
    switch i
        case 1
            plot(datetimes, DB1_current./DB1_max*100,"LineWidth",LineWidth);
            title('0 데시벨 1', 'FontSize', Fontsize_title);
        case 2
            plot(datetimes, DB2_current./DB2_max*100,"LineWidth",LineWidth);
            title('0 데시벨 2', 'FontSize', Fontsize_title);
        case 3
            plot(datetimes, ZONE1_current./ZONE1_max*100,"LineWidth",LineWidth);
            title('0 Zone 1', 'FontSize', Fontsize_title);
        case 4
            plot(datetimes, ZONE2_current./ZONE2_max*100,"LineWidth",LineWidth);
            title('0 Zone 2', 'FontSize', Fontsize_title);
        case 5
            plot(datetimes, Laptop_current./Laptop_max*100,"LineWidth",LineWidth);
            title('노트북실', 'FontSize', Fontsize_title);
        case 6
            plot(datetimes, Study_hall_current./Study_hall_max*100,"LineWidth",LineWidth);
            title('1인 스터디홀', 'FontSize', Fontsize_title);
        case 7
            total = DB1_current + DB2_current + ZONE1_current + ZONE2_current + Laptop_current + Study_hall_current;
            plot(datetimes, total,"LineWidth",LineWidth);
            title('도서관 총 학생 수', 'FontSize', Fontsize_title);
            ylabel('학생수')
            yyaxis right
            total_current = DB1_current + DB2_current + ZONE1_current + ZONE2_current + Laptop_current + Study_hall_current;
            total_max = DB1_max + DB2_max + ZONE1_max + ZONE2_max + Laptop_max + Study_hall_max;
            plot(datetimes, total_current./total_max * 100,"LineWidth",0.0001);
            ylabel('좌석점유율 [%]');
    end

    if i ~= 7
        ylabel('점유율 [%]');
    end

    % 자정 세로 점선 그리기
    for midnight = midnights
        xline(midnight, ':r', "LineWidth", 5);
    end
    
    % 정오 중앙에 날짜와 요일 표시
    first_noon = true;
    for noon = noons
        if first_noon
            first_noon = false;
            continue;
        end
        day_num = weekday(noon);
        switch day_num
            case 1
                day_str = '일';
            case 2
                day_str = '월';
            case 3
                day_str = '화';
            case 4
                day_str = '수';
            case 5
                day_str = '목';
            case 6
                day_str = '금';
            case 7
                day_str = '토';
        end
        date_str = datestr(noon, 'yyyy-mm-dd');
        text(noon, max(ylim()) * 0.95, [date_str ' ' day_str], 'HorizontalAlignment', 'center', 'Interpreter', 'none', 'FontSize', 14);
    end

    

    grid on;
    axis tight;
    set(gca, 'XTick', xticks_range);
%   datetick('x', 'mm/dd HH:MM', 'keepticks');
    datetick('x', 'HH:MM', 'keepticks');
    xlim([xticks_start, xticks_end]);
end


%% 시간별로 그룹화

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

% 시간별로 데이터 그룹화
hours = hour(datetimes);
data.Hour = hours;
%data = str2double(data);
%data(isnan(data)) = 0;

% data.Study_hall_max = str2double(data.Study_hall_max);
% data.Study_hall_current = str2double(data.Study_hall_current);
% data.InformationZoneMax = str2double(data.InformationZoneMax);
% data.InformationZoneCurrent = str2double(data.InformationZoneCurrent);
% data.business1Max = str2double(data.business1Max);
% data.business1Current = str2double(data.business1Current);
% data.business2Max = str2double(data.business2Max);
% data.business2Current = str2double(data.business2Current);

hour_groups = groupsummary(data, 'Hour', @mean, {'x0Decibel1Current', 'x0Decibel2Current', ...
    'x0Zone1Current', 'x0Zone2Current', 'LaptopZoneCurrent', 'Study_hall_max', 'Study_hall_current', ...
    'InformationZoneMax', 'InformationZoneCurrent', 'business1Max', 'business1Current', 'business2Max', 'business2Current'});

% 결과 출력
%disp(hour_groups);

% 데이터 시각화
figure;

hour_values = hour_groups.Hour;
DB1_mean = hour_groups.fun1_x0Decibel1Current / 266 * 100;
DB2_mean = hour_groups.fun1_x0Decibel2Current / 234 * 100;
ZONE1_mean = hour_groups.fun1_x0Zone1Current / 153 * 100;
ZONE2_mean = hour_groups.fun1_x0Zone2Current / 235 * 100;
Laptop_mean = hour_groups.fun1_LaptopZoneCurrent / 50 * 100;
Study_hall_mean = hour_groups.fun1_Study_hall_current / 32 * 100;
Information_mean = hour_groups.fun1_InformationZoneCurrent / 93 * 100;
Business1_mean = hour_groups.fun1_business1Current / 64 * 100;
Business2_mean = hour_groups.fun1_business2Current / 64 * 100;

barwidth = 1.2;

% 시간별 평균 데이터를 막대 그래프로 표시
bar(hour_values, [DB1_mean, DB2_mean, ZONE1_mean, ZONE2_mean, Laptop_mean, Study_hall_mean, ...
    Information_mean, Business1_mean, Business2_mean], barwidth);
title('각 시간대별 좌석 점유율 평균');
xlabel('시간');
ylabel('점유율 [%]');
legend('0 데시벨 1', '0 데시벨 2', '0 Zone 1', '0 Zone 2' ...
    , '노트북실', '1층 스터디홀', '전자정보실', '경도1', '경도2');
grid on;
axis tight;
xticks(0:1:24);