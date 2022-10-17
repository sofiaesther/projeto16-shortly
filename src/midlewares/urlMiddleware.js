import joi from 'joi';
import connection from '../db.js';

const newUrlSchema = joi.object({
    url: joi.string().uri().required()
});

const validateNewUrl = (req,res,next) =>{
    const validation = newUrlSchema.validate(req.body)

    if(validation.error){
        const erros = [];
        validation.error.details.map((e)=> erros.push(e.message));
        return res.status(422).send(erros);
    };
    next();
};

const hasUrl = async (req,res,next) =>{
    const urlId = req.params.id;

    try {
        const url = await connection.query(`
        SELECT
        id, "shortUrl","url"
        FROM
        urls
        WHERE
        id = $1
        LIMIT
        1
        ;`,[urlId]);


        if(url.rows.length ===0){
            return res.sendStatus(404);
        }
        res.locals.url = url.rows[0];

        next();
        
    } catch (error) {
        return res.sendStatus(error);
    };
};

const hasShort = async (req,res,next) =>{
    const shortUrl = req.params.shortUrl;

    try {
        const url = await connection.query(`
        SELECT
            *
        FROM
            urls
        WHERE
            "shortUrl" = $1
        LIMIT
            1
        ;
        `,[shortUrl]);

        if (url.rows.length ===0){
            return res.sendStatus(404);
        };

        res.locals.url = url.rows[0].url;
        res.locals.id = url.rows[0].id;
        next();
        
    } catch (error) {
        return res.sendStatus(error);
    };
};

const isUsersUrl = async (req,res,next) =>{
    const userId = res.locals.userId;
    const urlId = req.params.id;

    try {
        const urlDetails = await connection.query(`
        SELECT
        *
        FROM
        requests
        WHERE
        "urlId" = $1 AND "userId" = $2
        LIMIT
        1;`, [urlId,userId]);

        if (urlDetails.rows.length ===0){

            return res.sendStatus(401);
        };
        next();


    } catch (error) {
        return res.sendStatus(error);
    };
} ;

export{validateNewUrl,hasUrl, hasShort, isUsersUrl};