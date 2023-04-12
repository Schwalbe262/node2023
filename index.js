const UOSLibrary = require('./modules/UOSLibrary.js')

const interval = 0.5 * 60 * 1000; // 10분 간격으로 설정

async function main() {
  const seatsData = await UOSLibrary.getLibSeat();
  console.log(seatsData);
  appendDataToCsv(seatsData);
}

main();

setInterval(main, interval);