import bcrypt from 'bcrypt';
import connection from '../db.js';

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
export {Cripto,AuthPassword};