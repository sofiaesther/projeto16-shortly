import connection from "../db.js";
import {v4 as uuid} from 'uuid';

const SignUp = async (req,res)=>{

    const {name, email} = req.body;

    const password = res.locals.password;
    
    try {
        const query = await connection.query(
            `INSERT INTO 
            users ("name", "email", "password") 
            VALUES ($1,$2,$3);`,[name,email,password]);
        res.sendStatus(201);

    } catch (error) {
        res.sendStatus(error);
    };
};

const SignIn = async (req,res)=>{
    const email= res.locals.email;
    const userId = res.locals.userId;

    console.log(email,userId)
    
    try {
        const token = uuid();

        const query = await connection.query(`
        INSERT INTO
        sessions("userId","token")
        VALUES
        ($1,$2)
        `,[userId,token]);

        res.sendStatus(200).send({token: token});
        
    } catch (error) {
        res.sendStatus(error);
    };
};

export{SignUp, SignIn};