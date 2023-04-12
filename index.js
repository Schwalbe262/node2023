const UOSLibrary = require('./modules/UOSLibrary.js')

async function main() {
  let result = await UOSLibrary.getLibSeat("C")
  console.log(result)

  result = await UOSLibrary.getLibSeat("A")
  console.log(result)

  result = await UOSLibrary.getLibSeat("L")
  console.log(result)
}

main()