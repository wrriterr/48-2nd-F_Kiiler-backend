-- migrate:up
CREATE TABLE users(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(200) NOT NULL,
  nickname VARCHAR(50) NULL,
  agreement_id INT NOT NULL DEFAULT 1,
  agree_app TINYINT NOT NULL DEFAULT 0,
  agree_sms TINYINT NOT NULL DEFAULT 0,
  agree_email TINYINT NOT NULL DEFAULT 0,
  point DECIMAL(12,2) NOT NULL DEFAULT 100000.00,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (agreement_id) REFERENCES agreements (id)
);
-- migrate:down
DROP TABLE users; 