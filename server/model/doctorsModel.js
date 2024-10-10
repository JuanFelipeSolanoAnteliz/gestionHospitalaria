const driver = require('../helper/db/connection');
const Driver = new driver()

class Doctor extends driver{
    
    constructor(){
        super();
    }

    async getAllDoctors(){
        let con = await this.connectionFunction;
        const [results] = await con.data.query(
            'SELECT * FROM doctores;'
        );
        console.log(results)
    }

    async getAllDoctorsById(id){
        let con = await this.connectionFunction;
        const [results] = await con.data.query(
            `SELECT * FROM doctores WHERE id = ${id}  ; `
        );
        console.log(results)
    }
}

let obj = new Doctor();

obj.getAllDoctors();
obj.getAllDoctorsById(3);