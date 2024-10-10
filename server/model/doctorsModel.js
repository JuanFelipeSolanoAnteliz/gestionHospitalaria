const driver = require('../helper/db/connection');
const Driver = new driver()

module.exports = class Doctor extends driver{
    
    constructor(){
        super();
    }

    async getAllDoctors(){
        let con = await this.connectionFunction;
        const [results] = await con.data.query(
            'SELECT * FROM doctores;'
        );
        console.log(results)
        return ({status:200, message: `doctor fetched successfuly`, data:results});
    }

    async getAllDoctorsById(id){
        let con = await this.connectionFunction;
        const [results] = await con.data.query(
            `SELECT * FROM doctores WHERE id = ${id}  ; `
        );
        console.log(results);
        return ({status:200, message: `doctor fetched successfuly`, data:results});
    }
    async insertDoctor(data){
        let con = await this.connectionFunction;
        const query = `INSERT INTO doctores (id, nombre_completo, genero, especialidad_fk, fecha_nacimiento) VALUES (?,?,?,?,?)`;
        const [ results ] = await con.data.query( query, [data.id, data.nombre_completo, data.genero, data.especialidad, data.fecha_nacimiento]);
        console.log('doctor inserted with id:', results.insertId)
        return ({status:200, message: `doctor inserted successfuly with id: ${results.insertId}`});
    }
    async deleteDoctorByid(id){
        let con = await this.connectionFunction;
        const query = `DELETE FROM doctores WHERE id = ${id}`;
        const [ results ] = await con.data.query( query);
        console.log({status:200, message: `doctor deleted successfuly`, data: results});
        return ({status:200, message: `doctor deleted successfuly`, data: results});
    }

}

// obj.getAllDoctors();
// obj.getAllDoctorsById(11);
// obj.insertDoctor(18, 'Juan Felipe', 'masculino', 2, '2006-09-09')
// obj.deleteDoctorByid(11);