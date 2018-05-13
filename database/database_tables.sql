
CREATE TABLE USERS(
    ID SERIAL PRIMARY KEY,
    UUID INTEGER NOT NULL UNIQUE,
    USER_NAME TEXT,
    EMAIL TEXT NOT NULL UNIQUE,
    PHONE_NUMBER TEXT,
    PASSWORD TEXT NOT NULL,
    CREATE_AT TEXT
);

CREATE TABLE ADVERTS (
    ID SERIAL PRIMARY KEY,
    LOCATION TEXT NOT NULL, 
    OWNER_ID INTEGER REFERENCES USERS (ID),
    TITLE TEXT NOT NULL,
    DESCRIPTION TEXT,
    CATEGORY TEXT NOT NULL,
    PRICE INT,
    CONTACT TEXT
);

CREATE TABLE IMAGES_URL (
    ADVERT_ID INTEGER REFERENCES ADVERTS (ID),
    URL TEXT NOT NULL
);

CREATE TABLE MESSAGES (
    ID SERIAL PRIMARY KEY,
    SENDER_ID INTEGER REFERENCES USERS (ID),
    RECEIVER_ID INTEGER REFERENCES USERS (ID),
    BODY TEXT NOT NULL
);

CREATE TABLE RATINGS (
    ID SERIAL PRIMARY KEY,
    SENDER_ID INTEGER REFERENCES USERS (ID),
    RECEIVER_ID INTEGER REFERENCES USERS (ID),
    VALUE INTEGER CHECK (VALUE <= 5)
);

CREATE TABLE FAVORITES (
    ID SERIAL PRIMARY KEY,
    USER_ID INTEGER REFERENCES USERS (ID),
    ADVERT_ID INTEGER REFERENCES USERS (ID)
);

CREATE TABLE SESSIONS (
    ID SERIAL PRIMARY KEY,
    UUID TEXT NOT NULL UNIQUE,
    EMAIL TEXT NOT NULL,
    USER_ID INTEGER REFERENCES USERS(ID),
    CREATED_AT TIMESTAMP NOT NULL
);