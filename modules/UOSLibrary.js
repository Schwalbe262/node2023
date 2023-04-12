UOSLibrary = new Object()

const CheerSoup = require('cheersoup')
const FormData=require("form-data")
const request = require('request')
const fetch = require('node-fetch').default


const axios = require('axios')
const cheerio = require('cheerio')
const fs = require('fs')
const path = require('path')

UOSLibrary.getLibSeat = async function getLibSeat(){

    const url = 'http://wisem.uos.ac.kr/SEAT/domian5.asp';

    const response = await axios.get(url);
    const html = response.data;
    const $ = cheerio.load(html);

    const seatsData = {};

    // 0 데시벨 1
    seats1_1 = $('tr:nth-child(3) td:nth-child(3)').text().trim(); // 총좌석
    seats1_2 = $('tr:nth-child(3) td:nth-child(4)').text().trim(); // 잔여좌석
    seatsData['0DB_1_max'] = seats1_1;
    seatsData['0DB_1_current'] = seats1_2;
    // 0 데시벨 2
    seats2_1 = $('tr:nth-child(4) td:nth-child(3)').text().trim(); // 총좌석
    seats2_2 = $('tr:nth-child(4) td:nth-child(4)').text().trim(); // 잔여좌석
    seatsData['0DB_2_max'] = seats2_1;
    seatsData['0DB_2_current'] = seats2_2;
    // 0 ZONE 1
    seats3_1 = $('tr:nth-child(5) td:nth-child(3)').text().trim(); // 총좌석
    seats3_2 = $('tr:nth-child(5) td:nth-child(4)').text().trim(); // 잔여좌석
    seatsData['0ZONE_1_max'] = seats3_1;
    seatsData['0ZONE_1_current'] = seats3_2;
    // 0 ZONE 2
    seats4_1 = $('tr:nth-child(6) td:nth-child(3)').text().trim(); // 총좌석
    seats4_2 = $('tr:nth-child(6) td:nth-child(4)').text().trim(); // 잔여좌석
    seatsData['0ZONE_2_max'] = seats4_1;
    seatsData['0ZONE_2_current'] = seats4_2;

    return seatsData;

}


// 파일 기록 함수
UOSLibrary.appendDataToCsv = function appendDataToCsv(seatsData) {
    const fileName = 'seats.csv';

    const now = new Date();
    const koreaTime = new Intl.DateTimeFormat('ko-KR', {
    timeZone: 'Asia/Seoul',
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false
    }).format(now);

    const timestamp = koreaTime.toISOString();
    const row = `${timestamp},${seatsData['0DB_1_max']},${seatsData['0DB_1_current']},${seatsData['0DB_2_max']},${seatsData['0DB_2_current']},${seatsData['0ZONE_1_max']},${seatsData['0ZONE_1_current']},${seatsData['0ZONE_2_max']},${seatsData['0ZONE_2_current']}\n`;
    fs.appendFileSync(fileName, row);
  }
  


// 엑셀 초기 설정
UOSLibrary.initial_csv = function initial_csv() {
    const fs = require('fs');
    const path = require('path');

    const fileName = 'seats.csv';
    const headers = 'Timestamp,0 Decibel 1 max,0 Decibel 1 current,0 Decibel 2 max,0 Decibel 2 current,0 Zone 1 max,0 Zone 1 current,0 Zone 2 max,0 Zone 2 current\n';

    // 파일 없을때만 동작
    if (!fs.existsSync(fileName)) {
    fs.writeFileSync(fileName, headers);
    }
}


UOSLibrary.getLibSeat_old = async function getLibSeat(type){ // C : 중도 A : 경도 L : 볍도

    //let body = org.jsoup.Jsoup.connect("http://wisem.uos.ac.kr/mobile/MA/xml_seat_status_list.php").data("lib_gb", "C").post().select("item").toArray(); // original code
    //org.jsoup.Jsoup.connect("http://wisem.uos.ac.kr/mobile/MA/xml_seat_status_list.php").data("lib_gb", "C").post() <= 이부분은 fetch가 처리

    let form = new FormData()
    form.append("lib_gb",type)
    /*
    fetch("http://wisem.uos.ac.kr/mobile/MA/xml_seat_status_list.php",{
        body : form,
        method:"POST",
        headers: {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36'
        },
        encoding: null
    }).then(v=>v.text()).then(v=>body=v)
     */
    let body = await (await fetch("http://wisem.uos.ac.kr/mobile/MA/xml_seat_status_list.php", {
        body : form,
        method:"POST",
        headers: {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36'
        },
        encoding: null
    })).text()

    let bd = CheerSoup(body,{xmlMode:true}).select("item").toArray()



    let array = [];
    for (let i = 0; i < bd.length; i++) {
        let room_name
        if(type=="C"){ room_name = bd[i].select("room_name").text().replace("(중) ", ""); }
        else if(type=="A"){ room_name = bd[i].select("room_name").text().replace("(경) ", ""); }
        else if(type=="L"){ room_name = bd[i].select("room_name").text().replace("(법) ", ""); }
        let current_seat = bd[i].select("use_seat").text() // 여유좌석이 아닌 점유좌석임
        let total_seat = bd[i].select("total_seat").text()
        let my_seat = String(Number(total_seat) - Number(current_seat))
        array[i] = [[room_name],[my_seat],[total_seat]]
    }
    return array;
}

module.exports = UOSLibrary