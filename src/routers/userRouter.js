import { SignUp, SignIn } from "../controlers/usersController.js";
import { validSignUp, onlyUser } from "../midlewares/signUpMiddleware.js";
import { Cripto, AuthPassword } from "../midlewares/authMiddleware.js";
import { signInValidate, existUser } from "../midlewares/signInMiddlewars.js";
import express from 'express';

const router = express.Router();

router.post('/signup', onlyUser,validSignUp,Cripto,SignUp);
router.post('/signin',signInValidate,existUser,AuthPassword,SignIn);

export default router;