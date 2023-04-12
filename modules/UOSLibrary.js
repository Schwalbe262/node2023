UOSLibrary = new Object()

const CheerSoup = require('cheersoup')
const FormData=require("form-data")
const request = require('request')
const fetch = require('node-fetch').default

const axios = require('axios')
const cheerio = require('cheerio')

UOSLibrary.getLibSeat = async function getLibSeat(){

    const url = 'http://wisem.uos.ac.kr/SEAT/domian5.asp';

    const response = await axios.get(url);
    const html = response.data;
    const $ = cheerio.load(html);

    seats1 = $('tr:nth-child(3) td:nth-child(3)').text();
    seats2 = $('tr:nth-child(3) td:nth-child(4)').text();
    seats3 = $('tr:nth-child(3) td:nth-child(5)').text();

    console.log(seats1)
    console.log(seats2)
    console.log(seats3)

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