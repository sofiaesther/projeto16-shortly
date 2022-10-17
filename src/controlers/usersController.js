import connection from "../db.js";
import {v4 as uuid} from 'uuid';
import jwt from 'jsonwebtoken';

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
    
    try {
        let token;

        const hasToken = await connection.query(`
        SELECT
            token, "isValid"
        FROM
            sessions
        WHERE
            "userId" = $1 ;
        `, [userId]);
        
        if(hasToken.rows.length ===0){
            token = jwt.sign({
                id: userId
            }, process.env.TOKEN_SECRET);

            const query = await connection.query(`
            INSERT INTO
            sessions("userId","token")
            VALUES
            ($1,$2)
            ;`,[userId,token]);
    
        } else{
            token = hasToken.rows[0].token;

            if(!hasToken.isValid){
                const updateValidation = await connection.query(`
                UPDATE 
                    sessions
                SET 
                "isValid"=true
                WHERE
                "userId" = $1 AND token =$2
                ;`,[userId,token]);
            };

        };

        res.status(200).send({token: token});
        
    } catch (error) {
        
        res.sendStatus(error);
    };
};

export{SignUp, SignIn};