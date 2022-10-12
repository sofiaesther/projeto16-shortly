CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"name" varchar(80) NOT NULL,
	"email" varchar(100) NOT NULL UNIQUE,
	"password" varchar(50) NOT NULL
);



CREATE TABLE "url" (
	"id" SERIAL PRIMARY KEY,
	"shortUrl" varchar(20) NOT NULL UNIQUE,
	"url" varchar(1000) NOT NULL UNIQUE
);



CREATE TABLE "requests" (
	"id" serial PRIMARY KEY,
	"userId" integer REFERENCES "users"("id") NOT NULL,
	"urlId" integer REFERENCES "url"("id") NOT NULL UNIQUE,
	"createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);



CREATE TABLE "visitors" (
	"id" serial PRIMARY KEY,
	"urlId" integer REFERENCES "url"("id") NOT NULL UNIQUE,
	"userId" integer REFERENCES "users"("id") NOT NULL,
	"visitCount" integer NOT NULL
);



CREATE TABLE "sessions" (
	"id" integer PRIMARY KEY,
	"userId" integer REFERENCES "users"("id") NOT NULL,
	"token" varchar(255) NOT NULL UNIQUE
);




