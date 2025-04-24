CREATE TABLE users (
                       username VARCHAR(50) NOT NULL PRIMARY KEY,
                       password VARCHAR(500) NOT NULL,
                       enabled BOOLEAN NOT NULL
);

CREATE TABLE authorities (
                             username VARCHAR(50) NOT NULL,
                             authority VARCHAR(50) NOT NULL,
                             CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users(username)
);

-- Create case-insensitive index using LOWER() function
CREATE UNIQUE INDEX ix_auth_username ON authorities (LOWER(username), LOWER(authority));

-- You might also want to add a case-insensitive index on the users table
CREATE INDEX idx_users_username_lower ON users (LOWER(username));