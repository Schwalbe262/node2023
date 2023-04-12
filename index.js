const UOSLibrary = require('./modules/UOSLibrary.js')

result = await UOSLibrary.getLibSeat("C")
console.log(result)

result = await UOSLibrary.getLibSeat("A")
console.log(result)

result = await UOSLibrary.getLibSeat("L")
console.log(result)