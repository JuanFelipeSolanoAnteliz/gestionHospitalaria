const Doctor = require('../model/doctorsModel');
const doctor = new Doctor();

exports.getAll = async(req, res)=>{
    try{
        let resData = await doctor.getAllDoctors();
        console.log(resData)
        return res.json(resData);
    }catch(error){
        console.log(error);
        return res.json({status:404, message:'Doctors not fetched', error:error});
    }
}
exports.getById = async(req,res)=>{
    try{
        let resData = await doctor.getAllDoctorsById(parseInt(req.params.id));
        console.log(resData)
        return res.json(resData);
    }catch(error){
        console.log(error);
        return res.json({status:404, message:'Doctors not fetched', error:error});
    }
}
