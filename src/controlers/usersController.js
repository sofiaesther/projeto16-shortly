import connection from "../db.js";

const SignUp = async (req,res)=>{

    const {name, email} = req.body;

    const password = res.locals.password;
    
    try {
        const query = connection.query(`
            
        `,[name,email,password]);
        

    } catch (error) {
        res.send(error);
    };
};

const SignIn = async (req,res)=>{

    try {
        
    } catch (error) {
        res.send(error);
    };
};

export{SignUp, SignIn};