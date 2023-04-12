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

% 데이터 시각화
figure;

subplot(4, 2, 1);
plot(datetimes, DB1_current,"LineWidth",5);
title('0 데시벨 1 (점유좌석수)');
xlabel('Timestamp');
ylabel('Seats');

subplot(4, 2, 2);
plot(datetimes, DB1_current./DB1_max*100,"LineWidth",5);
title('0 데시벨 1 (좌석점유율 [%])');
xlabel('Timestamp');
ylabel('Seats');

subplot(4, 2, 3);
plot(datetimes, DB2_current,"LineWidth",5);
title('0 데시벨 2');
xlabel('Timestamp');
ylabel('Seats');

subplot(4, 2, 4);
plot(datetimes, DB2_current./DB2_max*100,"LineWidth",5);
title('0 데시벨 2 (좌석점유율 [%])');
xlabel('Timestamp');
ylabel('Seats');

subplot(4, 2, 5);
plot(datetimes, ZONE1_current,"LineWidth",5);
title('0 Zone 1');
xlabel('Timestamp');
ylabel('Seats');
subplot(3, 2, 6);

subplot(4, 2, 6);
plot(datetimes, ZONE1_current./ZONE1_max*100,"LineWidth",5);
title('0 Zone 1 (좌석점유율 [%])');
xlabel('Timestamp');
ylabel('Seats');

subplot(4, 2, 7);
plot(datetimes, ZONE2_current,"LineWidth",5);
title('0 Zone 2');
xlabel('Timestamp');
ylabel('Seats');

subplot(4, 2, 8);
plot(datetimes, ZONE2_current./ZONE2_max*100,"LineWidth",5);
title('0 Zone 2 (좌석점유율 [%])');
xlabel('Timestamp');
ylabel('Seats');