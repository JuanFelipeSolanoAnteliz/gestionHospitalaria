const driver = require('../db/connection');
const Driver = new driver()

class Doctor extends driver{
    
    constructor(){
        super();
    }

    async getAllDoctors(){
        let con = await this.connection;
        const results = await con.data.query(
            'select * from doctores;'
        );
        console.log(results)
    }
}