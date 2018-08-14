DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS checks;
DROP TABLE IF EXISTS messages;

CREATE TABLE users (id VARCHAR(64) PRIMARY KEY, name VARCHAR(256), email VARCHAR(256), username VARCHAR(64), password VARCHAR(64), is_admin BOOLEAN, UNIQUE (email), UNIQUE (username));
CREATE TABLE accounts (id VARCHAR(64) PRIMARY KEY, amount NUMERIC(12,4), number INTEGER, owner_id VARCHAR(64));
CREATE TABLE checks (id VARCHAR(64) PRIMARY KEY, amount NUMERIC(12,4), number VARCHAR(16), account_id VARCHAR(64));
CREATE TABLE messages (id VARCHAR(62) PRIMARY KEY, name VARCHAR(256), email VARCHAR(256), subject VARCHAR(128), message VARCHAR(2048));

CREATE UNIQUE INDEX users_password_idx ON users (username, password);

INSERT INTO users (id, name, email, username, password, is_admin) VALUES (1, 'John Coltraine', 'john@coltraine.com', 'john.coltraine', '1e27d00f640b373c9c67ab5d7e20040c8fc54301', 'false');
INSERT INTO users (id, name, email, username, password, is_admin) VALUES (2, 'Upton Sinclair', 'upton@sinclair.com', 'upton.sinclair', '5944c2df656e8ad2ad09f25aca400bce2ce1ae14', 'false');
INSERT INTO users (id, name, email, username, password, is_admin) VALUES (3, 'Admin Admin', 'admin@terracottabank.com', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'true');
INSERT INTO users (id, name, email, username, password, is_admin) VALUES (4, 'Josh Cummings', 'josh@cummings.com', 'josh.cummings', '4009ce750f90030aed3d651b95210c8b6dfb8fde', 'false');

INSERT INTO accounts (id, amount, number, owner_id) VALUES (1, 2500, 987654321, 1);
INSERT INTO accounts (id, amount, number, owner_id) VALUES (2, 25, 987654322, 2);
INSERT INTO accounts (id, amount, number, owner_id) VALUES (4, 12, 987654323, 4);

INSERT INTO messages (id, name, email, subject, message) VALUES (1, '<script>alert("contact name is vulnerable to reflected xss")</script>', '<script>alert("contact email is vulnerable to reflected xss")</script>', '<script>alert("message subject is vulnerable to reflected xss")</script>', '<script>alert("message content is vulnerable to reflected xss")</script>');
	