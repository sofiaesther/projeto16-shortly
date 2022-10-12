import express from 'express';
import cors from 'cors';
import './setup.js';

const app = express();



app.listen(process.env.PORT,()=>{
    console.log(`listen on ${process.env.PORT}`)
});

export default app;