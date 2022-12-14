import joi from 'joi';
import connection from '../db.js';

const signUpSchema = joi.object({
  name: joi.string().max(80).required(),
  email: joi.string().max(100).required().email(),
  password: joi.string().max(80).required(),
  confirmPassword: joi.string().valid(joi.ref('password'))
});

const validSignUp = (req,res,next)=>{
    const validation = signUpSchema.validate(req.body, {abortEarly:false});

    if(validation.error){
        const erros = [];
        validation.error.details.map((e)=> erros.push(e.message));
        return res.status(422).send(erros);
    }

    next();
}

const onlyUser = async (req,res,next) =>{
    const email = req.body.email;

    try {
        const user = await connection.query(`
        SELECT
        *
        FROM
        users
        WHERE
        email = $1
        `, [email]);

        if(user.rows.length >0){
           return res.sendStatus(409);
        }
        next();
        
    } catch (error) {
        res.sendStatus(error)
    }
}

export{validSignUp,onlyUser};