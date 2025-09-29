CREATE DATABASE movie_project;
USE movie_project;

-- 영화 정보
CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    duration INT NOT NULL, -- 상영 시간(분)
    release_date DATE NOT NULL
);

-- 상영관 정보
CREATE TABLE theaters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(200)
);

-- 상영 스케줄 (어떤 영화가 언제 어느 상영관에서 상영되는지)
CREATE TABLE screenings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    theater_id INT NOT NULL,
    screening_time DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (theater_id) REFERENCES theaters(id)
);

-- 좌석 테이블 (상영관마다 좌석 배치가 다르다면 필요)
CREATE TABLE seats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    theater_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL, -- 예: A1, B3 등
    UNIQUE(theater_id, seat_number),
    FOREIGN KEY (theater_id) REFERENCES theaters(id)
);

-- 예매 정보
CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    screening_id INT NOT NULL,
    seat_id INT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    reserved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (screening_id) REFERENCES screenings(id),
    FOREIGN KEY (seat_id) REFERENCES seats(id),
    UNIQUE(screening_id, seat_id) -- 중복 예매 방지 (한 좌석에 대해 중복 예약 불가)
);

INSERT INTO movies (title ,duration,release_date) VALUES ('기생충',150, '1999-11-11');
INSERT INTO movies (title,duration,release_date) VALUES ('어벤져스',150, '1999-11-11');
INSERT INTO movies (title,duration,release_date) VALUES ('인셉션',150, '1999-11-11');