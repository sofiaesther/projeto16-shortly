import joi from 'joi';

const signUpSchema = joi.object({
  name: joi.string().max(80).required(),
  email: joi.string().max(100).required().email(),
  password: joi.string().max(80).required(),
  confirmPassword: joi.string().valid(joi.ref('password'))
});

const validSignUp = (req,res,next)=>{
    const validation = signUpSchema.validate(req.body);

    if(validation.error){
        console.log(validation);
        return res.sendStatus(422).send(validation);
    }

    next();
}
export{validSignUp};