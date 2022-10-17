import joi from 'joi';
import connection from '../db.js';
import jwt from 'jsonwebtoken';

const signInSchema = joi.object({
  email: joi.string().max(100).email().required(),
  password: joi.string().max(80).required()
});

const signInValidate = (req,res,next)=>{

    const validation = signInSchema.validate(req.body);
    if(validation.error){
        const erros = [];
        validation.error.details.map((e)=> erros.push(e.message));
        return res.status(422).send(erros);
    }
    next();
}

const existUser = async(req,res,next)=>{
        const {email} = req.body;

    try {
        const hasEmail = await connection.query(`
        SELECT * 
        FROM
        users
        WHERE
        email =$1
        LIMIT 
        1
        `,[email]);

        if(hasEmail.rows.length<1){
            return res.sendStatus(401);
        }
        const userId = hasEmail.rows[0].id

        res.locals.userId = userId;

        next();
        
    } catch (error) {
        res.sendStatus(error);
    };
};



export{signInValidate,existUser};