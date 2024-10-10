const Doctor = require('../model/doctorsModel');
const doctor = new Doctor();

exports.getAll = async(req, res)=>{
    try{
        console.log('controller')
        let resData = await doctor.getAllDoctors();
        console.log(resData)
        return res.json(resData);
    }catch(error){
        console.log(error);
        return res.json({status:404, message:'Doctors not fetched', error:error});
    }
}
