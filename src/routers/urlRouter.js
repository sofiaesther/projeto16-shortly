
import express from 'express';
import { newShorten, getUrl, goToUrl } from '../controlers/urlController.js';
import { validateNewUrl, hasUrl, hasShort } from '../midlewares/urlMiddleware.js';
import { auth } from '../midlewares/authMiddleware.js';

const router = express.Router();

router.post('/urls/shorten',validateNewUrl,auth,newShorten);

router.get('/urls/:id',hasUrl,getUrl);

router.get('/urls/open/:shortUrl', hasShort, goToUrl);


export default router;