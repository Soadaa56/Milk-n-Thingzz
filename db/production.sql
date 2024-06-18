CREATE_DATABASE soadaa_production;

-- -- Create crafts table
-- CREATE TABLE crafts (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(255),
--   category VARCHAR(255),
--   image_data TEXT,
--   description TEXT,
--   created_at TIMESTAMP NOT NULL,
--   updated_at TIMESTAMP NOT NULL
-- );

-- -- Create craft_images table
-- CREATE TABLE craft_images (
--   id SERIAL PRIMARY KEY,
--   craft_id INTEGER NOT NULL REFERENCES crafts(id),
--   image_path VARCHAR(255),
--   created_at TIMESTAMP NOT NULL,
--   updated_at TIMESTAMP NOT NULL
-- );

-- -- Create users table (including Devise columns)
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   email VARCHAR(255) NOT NULL,
--   encrypted_password VARCHAR(255) NOT NULL,
--   reset_password_token VARCHAR(255),
--   reset_password_sent_at TIMESTAMP,
--   remember_created_at TIMESTAMP,
--   username VARCHAR(255),
--   role INTEGER,
--   bio VARCHAR(255),
--   created_at TIMESTAMP NOT NULL,
--   updated_at TIMESTAMP NOT NULL
-- );

-- -- Create comments table
-- CREATE TABLE comments (
--   id SERIAL PRIMARY KEY,
--   craft_id INTEGER NOT NULL REFERENCES crafts(id),
--   user_id INTEGER NOT NULL REFERENCES users(id),
--   created_at TIMESTAMP NOT NULL,
--   updated_at TIMESTAMP NOT NULL
-- );

-- -- Indexes
-- CREATE INDEX index_users_on_email ON users(email);
-- CREATE INDEX index_users_on_reset_password_token ON users(reset_password_token);
-- CREATE UNIQUE INDEX index_users_on_username ON users(username);
-- CREATE INDEX index_comments_on_craft_id ON comments(craft_id);
-- CREATE INDEX index_comments_on_user_id ON comm
