import bcrypt from 'bcrypt';

const Cripto = (req,res,next)=>{
    const password = req.body.password;

    const crypt = bcrypt.hashSync(password,10);

    res.locals.password = crypt;

    next();
};

export {Cripto};