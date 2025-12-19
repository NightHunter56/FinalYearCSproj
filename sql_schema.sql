CREATE DATABASE IF NOT EXISTS chess_tournament;
USE chess_tournament;

CREATE TABLE IF NOT EXISTS tournaments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    num_rounds INT NOT NULL,
    current_round INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    rating INT NOT NULL,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT NOT NULL,
    round_num INT NOT NULL,
    player1_id INT NOT NULL,
    player2_id INT,
    result FLOAT,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id) ON DELETE CASCADE,
    FOREIGN KEY (player1_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (player2_id) REFERENCES players(id) ON DELETE CASCADE
);