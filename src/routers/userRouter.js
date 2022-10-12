import { SignUp } from "../controlers/usersController.js";
import { validSignUp } from "../midlewares/signUpMiddleware.js";
import { Cripto } from "../midlewares/criptoMiddleware.js";
import express from 'express';

const router = express.Router();

router.post('/signup', validSignUp,Cripto,SignUp);


export default router;