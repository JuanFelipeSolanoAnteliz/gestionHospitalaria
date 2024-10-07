const express = require('express');
const app = express();
const { join,dirname } = require('path');
const indexRouter = require('./server/router/indexRouter');

app.use('/css', express.static(join(__dirname, process.env.EXPRESS_STATIC, '/css')));

app.get('/', (req, res, next)=>{
    req.__dirname = __dirname;
    next();
}, indexRouter);

const config = {
    port: process.env.EXPRESS_PORT,
    host: process.env.EXPRESS_HOST_NAME
};

app.listen(config,()=>{
    console.log(`server runnin at ${process.env.EXPRESS_PROTOCOL}${process.env.EXPRESS_HOST_NAME}:${process.env.EXPRESS_PORT}`);
});
