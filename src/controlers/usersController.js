import connection from "../db.js";
import {v4 as uuid} from 'uuid';
import jwt from 'jsonwebtoken';

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
    const email= res.locals.email;
    const userId = res.locals.userId;
    
    try {
        let token;

        const hasToken = await connection.query(`
        SELECT
            token, "isValid"
        FROM
            sessions
        WHERE
            "userId" = $1 ;
        `, [userId]);
        
        if(hasToken.rows.length ===0){
            token = jwt.sign({
                id: userId
            }, process.env.TOKEN_SECRET);

            const query = await connection.query(`
            INSERT INTO
            sessions("userId","token")
            VALUES
            ($1,$2)
            ;`,[userId,token]);
    
        } else{
            token = hasToken.rows[0].token;

            if(!hasToken.isValid){
                const updateValidation = await connection.query(`
                UPDATE 
                    sessions
                SET 
                "isValid"=true
                WHERE
                "userId" = $1 AND token =$2
                ;`,[userId,token]);
            };

        };

        res.status(200).send({token: token});
        
    } catch (error) {
        
        res.sendStatus(error);
    };
};

const userUrls = async (req,res)=>{
    const userId = res.locals.userId;

    try {
        const userInfo = (await connection.query(`
        SELECT 
            u.id, u.name, SUM(s.visitors) AS "visitCount"
        FROM
            users u
        JOIN
            (   SELECT 
                    r."userId", COUNT(v.id) AS "visitors" 
                FROM 
                    requests r
                JOIN 
                    "visitorsCount" v ON r."urlId" = v."urlId"
                GROUP BY 
                    r."userId") s ON u.id = s."userId"
        WHERE
            u.id = $1
        GROUP BY
            u.id
        LIMIT
        1
        ;`,[userId])).rows[0];

        const userUrls = await connection.query(`
        SELECT
            r."urlId" AS id, l."shortUrl", l.url, COUNT(v.id) AS "visitors" 
        FROM
            requests r  
        JOIN
            urls l ON r."urlId"= l.id
        JOIN
            "visitorsCount" v ON r.id = v."urlId"
        WHERE
            r."userId" = $1
        GROUP BY
            r."urlId",l."shortUrl", l.url
        ;`,[userId]);

        
        userInfo.shortenedUrls= userUrls.rows;

        res.status(200).send(userInfo)
        
    } catch (error) {
        res.sendStatus(error);
    };
}; 

const ranking = async(req,res)=>{
    try {
        const rank = await connection.query(`
        SELECT 
            u.id, u.name, s."visitorsCount", o."linksCount"
        FROM
            users u
        LEFT JOIN ( 
            SELECT 
                r."userId", COUNT(v.id) AS "visitorsCount"
            FROM 
                requests r
            JOIN 
                "visitorsCount" v ON r."urlId" = v."urlId"
            GROUP BY 
                r."userId"
            ) s ON u.id = s."userId"
        LEFT JOIN ( 
            SELECT r."userId", COUNT(r."urlId") AS "linksCount"
            from requests r
            GROUP BY r."userId"
            ) o ON u.id = o."userId"
        
        ORDER BY s."visitorsCount" DESC NULLS LAST
        LIMIT 10
        ;
        `);
        res.status(200).send(rank.rows);
    } catch (error) {
        res.sendStatus(error);
    };
}; 

export{SignUp, SignIn, userUrls, ranking};