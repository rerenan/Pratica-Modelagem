 CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY,
    "fullName" varchar(50) NOT NULL,
    "cpf" varchar(11) NOT NULL UNIQUE,
    "email" text NOT NULL UNIQUE,
    "password" text NOT NULL
);
CREATE TABLE "states" (
    "id" INTEGER PRIMARY KEY,
    "name" text NOT NULL
);

CREATE TABLE "cities" (
    "id" INTEGER PRIMARY KEY,
    "name" text NOT NULL,
    "stateId" INTEGER REFERENCES states(id)
);

CREATE TABLE "customerAddresses" (
    "id" INTEGER PRIMARY KEY,
    "customerId" INTEGER REFERENCES customers(id),
    "street" varchar(100) NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" text,
    "postalCode" bigint NOT NULL,
    "cityId" INTEGER REFERENCES cities(id)
);

CREATE TABLE "customerPhones" (
    "id" INTEGER PRIMARY KEY,
    "customerId" INTEGER REFERENCES customers(id),
    "number" bigint NOT NULL,
    "type" text NOT NULL
);

CREATE TABLE "bankAccount" (
    "id" INTEGER PRIMARY KEY,
    "customerId" INTEGER REFERENCES customers(id),
    "accountNumber" bigint NOT NULL,
    "agency" text NOT NULL,
    "openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP
);

CREATE TABLE "transactions" (
    "id" INTEGER PRIMARY KEY,
    "bankAccountId" INTEGER REFERENCES bankAccount(id),
    "amount" bigint NOT NULL,
    "type" text NOT NULL,
    "time" TIMESTAMP NOT NULL DEFAULT NOW(),
    "description" text,
    "cancelled" bollean NOT NULL DEFAULT false
);

CREATE TABLE "creditCards" (
    "id" INTEGER PRIMARY KEY,
    "bankAccountId" INTEGER REFERENCES bankAccount(id),
    "name" varchar(60) NOT NULL,
    "number" bigint NOT NULL,
    "securityCode" INTEGER NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    "password" text NOT NULL
    "limit" bigint NOT NULL
);
