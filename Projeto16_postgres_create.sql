CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"name" varchar(80) NOT NULL,
	"email" varchar(100) NOT NULL UNIQUE,
	"password" varchar(255) NOT NULL,
	"createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);



CREATE TABLE "urls" (
	"id" SERIAL PRIMARY KEY,
	"shortUrl" varchar(20) NOT NULL UNIQUE,
	"url" varchar(1000) NOT NULL,
	"createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);



CREATE TABLE "requests" (
	"id" serial PRIMARY KEY,
	"userId" integer REFERENCES "users"("id") NOT NULL,
	"urlId" integer REFERENCES "urls"("id") NOT NULL UNIQUE,
	"createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);



CREATE TABLE "visitors" (
	"id" serial PRIMARY KEY,
	"urlId" integer REFERENCES "urls"("id") NOT NULL UNIQUE,
	"userId" integer REFERENCES "users"("id") NOT NULL,
	"createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE "visitorsCount" (
	"id" serial PRIMARY KEY,
	"urlId" integer REFERENCES "urls"("id") NOT NULL,
	"createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE "sessions" (
	"id" serial PRIMARY KEY,
	"userId" integer REFERENCES "users"("id") NOT NULL,
	"token" varchar(255) NOT NULL UNIQUE,
	"createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);