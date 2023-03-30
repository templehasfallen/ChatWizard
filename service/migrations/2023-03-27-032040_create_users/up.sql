-- Your SQL goes here
CREATE TABLE users (
  id BINARY PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER auto_update_users_updated_at
  AFTER UPDATE ON users
  FOR EACH ROW
  BEGIN
    UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
  END;