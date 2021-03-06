Drop TABLE IF EXISTS card_holder;
Drop TABLE IF EXISTS credit_card;
Drop TABLE IF EXISTS merchant;
Drop TABLE IF EXISTS merchant_category;
Drop TABLE IF EXISTS transactions;

CREATE TABLE "card_holder" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "credit_card" (
    "card" VARCHAR(255)   NOT NULL,
    "id_card_holder" INT   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "merchant_category" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchant" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "transactions" (
    "id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" VARCHAR(255)   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_transactions" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_id_card_holder" FOREIGN KEY("id_card_holder")
REFERENCES "card_holder" ("id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("id");

