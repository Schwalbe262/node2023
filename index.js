const UOSLibrary = require('./modules/UOSLibrary.js')

UOSLibrary.initial_csv(); // CSV 파일 초기화

const interval = 0.5 * 60 * 1000; // 10분 간격으로 설정

async function main() {
  const seatsData = await UOSLibrary.getLibSeat();
  console.log(seatsData);
  await UOSLibrary.appendDataToCsv(seatsData);
}

main();

setInterval(main, interval);