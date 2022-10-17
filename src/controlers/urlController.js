import connection from "../db.js";
import { customAlphabet } from 'nanoid';

const newShorten = async (req,res)=>{
    const userId = res.locals.userId;
    const url = req.body.url;
    const nanoid = customAlphabet('1234567890abcdef', 10);
    let newUrl= nanoid();

    try {
        const inserturl = await connection.query(`
        INSERT INTO
        urls ("shortUrl","url")
        VALUES
        ($1,$2);`,[newUrl,url]);

        const urlId = await connection.query(`
        SELECT
        id
        FROM
        urls
        WHERE
        "shortUrl" = $1 AND "url"=$2
        ;`,[newUrl,url]);


        const insertRequest = await connection.query(`
        INSERT INTO
        requests ("userId","urlId")
        VALUES
        ($1,$2);`,[userId,urlId.rows[0].id]);

        res.status(201).send({shortUrl: newUrl});
        
    } catch (error) {
        res.sendStatus(error);
    }
};

const getUrl = (req,res) =>{
    const urlDetails = res.locals.url;

    res.status(200).send(urlDetails);
};

const goToUrl = async (req,res) =>{
    const url = res.locals.url;
    const id = res.locals.id;

    try {
        const addVisit = await connection.query(`
        INSERT INTO
        "visitorsCount" ("urlId")
        VALUES
        ($1)
        `,[id]);

        return res.redirect(url);
    } catch (error) {
        return res.sendStatus(error);
    };
};

const deleteUrl = async( req,res) =>{
    const urlId = req.params.id;

    try {
        const deleteRequest = await connection.query(`
        DELETE FROM
        requests
        WHERE
        "urlId" = $1;`,[urlId]);
        
        const deleteUrl = await connection.query(`
        DELETE FROM
        urls
        WHERE
        id = $1;`,[urlId]);
        res.sendStatus(204);

    } catch (error) {
        return res.sendStatus(error);
    };
};

export{newShorten, getUrl, goToUrl, deleteUrl};