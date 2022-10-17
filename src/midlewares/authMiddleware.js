import bcrypt from 'bcrypt';
import connection from '../db.js';
import jwt from 'jsonwebtoken';

const Cripto = (req,res,next)=>{
    const password = req.body.password;

    const crypt = bcrypt.hashSync(password,10);

    res.locals.password = crypt;

    next();
};


const AuthPassword = async (req,res,next)=>{
    const password = req.body.password;
    const userId = res.locals.userId;

    try {
        const passwordSaved = await connection.query(`
        SELECT
        password
        FROM
        users
        WHERE
        id = $1
        `,[userId]);
        const userCode = passwordSaved.rows[0].password;

        if(passwordSaved.rows.length!==1 || !bcrypt.compareSync(password, userCode)){
            return res.sendStatus(401);
        };

        res.locals.password = passwordSaved.rows[0].password;
        next();
    } catch (error) {
        res.sendStatus(error);
    }
}

const auth = async (req,res,next) => {
    const authorization = req.headers.authorization;

    if(!authorization|| authorization.slice(0,7) !== 'Bearer '){
        console.log('1')
        return res.sendStatus(401);
    };

    const token = authorization.replace('Bearer ','');

    const userId = (jwt.verify(token,process.env.TOKEN_SECRET)).id;


    try {
        const hasToken = await connection.query(`
        SELECT
        "isValid"
        FROM
        sessions
        WHERE
        "userId" = $1 AND token = $2
        LIMIT
        1
        ;
        `,[userId,token]);

        if(hasToken.rows.length ===0|| !hasToken.rows[0].isValid){
            return res.sendStatus(401);
        };

        res.locals.userId = userId;
        next();

    } catch (error) {
        res.sendStatus(error);
    }



};
export {Cripto,AuthPassword,auth};