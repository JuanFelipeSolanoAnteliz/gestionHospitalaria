const mysql = require( 'mysql2/promise')


class driver {
    connection;

    constructor(){

    }

    get connectionFunction(){
        return mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password:'campus2023',
            port:3306,
            database:'hospital',
        }).then(res=>{
            return {status:200, message:'connection stablished', data:res}
        }).catch(error=>{
            throw new Error(JSON.stringify({status: 500, message:'error in the connection', data: error}))
        })

    }
}

module.exports = driver;

// let obj = new driver();

// obj.connectionFunction.then(res=>{
//     console.log(res);
// }).catch(error=>{
//     let err = JSON.parse(error.message);
//     console.log(err);
// })
