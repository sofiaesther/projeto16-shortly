import connection from "../db.js";

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

    try {
        
    } catch (error) {
        res.send(error);
    };
};

export{SignUp, SignIn};