

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    rating VARCHAR(20) NOT NULL
);

CREATE TABLE showtimes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE seats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    showtime_id INT NOT NULL,
    row_num INT NOT NULL,
    col_num INT NOT NULL,
    is_reserved BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    seat_id INT NOT NULL,
    booking_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (seat_id) REFERENCES seats(id)
);

-- 샘플 데이터 입력
INSERT INTO movies (title, duration, rating) VALUES 
('이터널스', 138, '12세 이상'),
('스파이더맨: 노 웨이 홈', 148, '15세 이상');

INSERT INTO showtimes (movie_id, start_time) VALUES
(1, '2024-07-01 19:00:00'), (1, '2024-07-01 21:30:00'), 
(2, '2024-07-01 20:00:00');

-- 좌석 샘플 생성 (예: 5행 8열)
DELIMITER //
CREATE PROCEDURE createSeatsForShowtime(IN st_id INT)
BEGIN
  DECLARE r INT DEFAULT 1;
  DECLARE c INT;
  WHILE r <= 5 DO
    SET c = 1;
    WHILE c <= 8 DO
      INSERT INTO seats(showtime_id, row_num, col_num) VALUES (st_id, r, c);
      SET c = c + 1;
    END WHILE;
    SET r = r + 1;
  END WHILE;
END //
DELIMITER ;

-- 각 상영에 좌석 생성 호출 예:
CALL createSeatsForShowtime(1);
CALL createSeatsForShowtime(2);
CALL createSeatsForShowtime(3);