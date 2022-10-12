import express from 'express';
import cors from 'cors';
import './setup.js';
import connection from './db.js';

import userRouter from './routers/userRouter.js'

const app = express();
app.use(express.json());
app.use(cors());

app.use(userRouter);




app.listen(process.env.PORT,()=>{
    console.log(`listen on ${process.env.PORT}`)
});

export default app;