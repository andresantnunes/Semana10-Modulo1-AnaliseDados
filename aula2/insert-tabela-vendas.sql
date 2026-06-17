INSERT INTO ecommerce.cliente (nome, email) VALUES 
('Ana Silva', 'ana1@exemplo.com'), ('Bruno Costa', 'bruno2@exemplo.com'), ('Carlos Dias', 'carlos3@exemplo.com'), ('Diana Souza', 'diana4@exemplo.com'), ('Eduardo Lima', 'eduardo5@exemplo.com'),
('Fernanda Alves', 'fernanda6@exemplo.com'), ('Gabriel Rocha', 'gabriel7@exemplo.com'), ('Helena Martins', 'helena8@exemplo.com'), ('Igor Pires', 'igor9@exemplo.com'), ('Juliana Melo', 'juliana10@exemplo.com'),
('Kleber Nunes', 'kleber11@exemplo.com'), ('Larissa Freitas', 'larissa12@exemplo.com'), ('Marcelo Vieira', 'marcelo13@exemplo.com'), ('Natalia Gomes', 'natalia14@exemplo.com'), ('Otávio Ramos', 'otavio15@exemplo.com'),
('Patricia Castro', 'patricia16@exemplo.com'), ('Quiteria Barros', 'quiteria17@exemplo.com'), ('Ricardo Santos', 'ricardo18@exemplo.com'), ('Simone Rocha', 'simone19@exemplo.com'), ('Tiago Farias', 'tiago20@exemplo.com'),
('Ursula Mendes', 'ursula21@exemplo.com'), ('Victor Hugo', 'victor22@exemplo.com'), ('Wagner Silva', 'wagner23@exemplo.com'), ('Xenia Souza', 'xenia24@exemplo.com'), ('Yara Lima', 'yara25@exemplo.com'),
('Zeca Camargo', 'zeca26@exemplo.com'), ('Alice Braga', 'alice27@exemplo.com'), ('Beto Barbosa', 'beto28@exemplo.com'), ('Caio Castro', 'caio29@exemplo.com'), ('Debora Secco', 'debora30@exemplo.com'),
('Eliana Rocha', 'eliana31@exemplo.com'), ('Fabio Assunção', 'fabio32@exemplo.com'), ('Gloria Pires', 'gloria33@exemplo.com'), ('Humberto Martins', 'humberto34@exemplo.com'), ('Ivana Costa', 'ivana35@exemplo.com'),
('Joao Kleber', 'joao36@exemplo.com'), ('Karina Bacchi', 'karina37@exemplo.com'), ('Luis Gustavo', 'luis38@exemplo.com'), ('Monica Iozzi', 'monica39@exemplo.com'), ('Nelson Rubens', 'nelson40@exemplo.com'),
('Olga Bongiovanni', 'olga41@exemplo.com'), ('Paula Fernandes', 'paula42@exemplo.com'), ('Quico Flores', 'quico43@exemplo.com'), ('Renata Fan', 'renata44@exemplo.com'), ('Sergio Mallandro', 'sergio45@exemplo.com'),
('Tatiana Maslany', 'tatiana46@exemplo.com'), ('Ulisses Guimarães', 'ulisses47@exemplo.com'), ('Vera Fischer', 'vera48@exemplo.com'), ('Will Smith', 'will49@exemplo.com'), ('Xuxa Meneghel', 'xuxa50@exemplo.com');

INSERT INTO ecommerce.produto (nome, preco) VALUES 
('Notebook', 3500.00), ('Mouse', 150.00), ('Teclado', 200.00), ('Monitor', 1200.00), ('Cadeira', 800.00),
('Mesa', 500.00), ('Fone', 300.00), ('Webcam', 450.00), ('Impressora', 1500.00), ('Roteador', 350.00),
('HD Externo', 400.00), ('SSD', 600.00), ('Memoria RAM', 250.00), ('Placa de Video', 2500.00), ('Fonte', 550.00),
('Gabinete', 400.00), ('Cooler', 150.00), ('Cabo HDMI', 50.00), ('Adaptador', 80.00), ('Hub USB', 120.00),
('Microfone', 700.00), ('Caixa de Som', 300.00), ('Joystick', 250.00), ('Suporte', 100.00), ('Mousepad', 60.00),
('Lampada Smart', 150.00), ('Tomada Smart', 100.00), ('Camera Seg', 350.00), ('Tablet', 1800.00), ('Smartphone', 3000.00),
('Smartwatch', 1200.00), ('Bateria', 200.00), ('Carregador', 120.00), ('Capa Celular', 80.00), ('Película', 50.00),
('Drone', 4000.00), ('Projetor', 2200.00), ('Kindle', 600.00), ('Livro', 70.00), ('Agenda', 40.00),
('Caneta', 10.00), ('Mochila', 250.00), ('Pasta', 30.00), ('Calculadora', 80.00), ('Grampeador', 50.00),
('Fita Adesiva', 15.00), ('Tesoura', 25.00), ('Papel A4', 30.00), ('Envelope', 20.00), ('Clip', 5.00);

INSERT INTO ecommerce.venda (cliente_id, produto_id, data_venda) VALUES 
(1, 1, '2026-06-01 10:00:00'), (2, 2, '2026-06-01 11:00:00'), (3, 3, '2026-06-01 12:00:00'), (4, 4, '2026-06-01 13:00:00'), (5, 5, '2026-06-01 14:00:00'),
(6, 6, '2026-06-01 15:00:00'), (7, 7, '2026-06-01 16:00:00'), (8, 8, '2026-06-01 17:00:00'), (9, 9, '2026-06-01 18:00:00'), (10, 10, '2026-06-01 19:00:00'),
(11, 11, '2026-06-02 10:00:00'), (12, 12, '2026-06-02 11:00:00'), (13, 13, '2026-06-02 12:00:00'), (14, 14, '2026-06-02 13:00:00'), (15, 15, '2026-06-02 14:00:00'),
(16, 16, '2026-06-02 15:00:00'), (17, 17, '2026-06-02 16:00:00'), (18, 18, '2026-06-02 17:00:00'), (19, 19, '2026-06-02 18:00:00'), (20, 20, '2026-06-02 19:00:00'),
(21, 21, '2026-06-03 10:00:00'), (22, 22, '2026-06-03 11:00:00'), (23, 23, '2026-06-03 12:00:00'), (24, 24, '2026-06-03 13:00:00'), (25, 25, '2026-06-03 14:00:00'),
(26, 26, '2026-06-03 15:00:00'), (27, 27, '2026-06-03 16:00:00'), (28, 28, '2026-06-03 17:00:00'), (29, 29, '2026-06-03 18:00:00'), (30, 30, '2026-06-03 19:00:00'),
(31, 31, '2026-06-04 10:00:00'), (32, 32, '2026-06-04 11:00:00'), (33, 33, '2026-06-04 12:00:00'), (34, 34, '2026-06-04 13:00:00'), (35, 35, '2026-06-04 14:00:00'),
(36, 36, '2026-06-04 15:00:00'), (37, 37, '2026-06-04 16:00:00'), (38, 38, '2026-06-04 17:00:00'), (39, 39, '2026-06-04 18:00:00'), (40, 40, '2026-06-04 19:00:00'),
(41, 41, '2026-06-05 10:00:00'), (42, 42, '2026-06-05 11:00:00'), (43, 43, '2026-06-05 12:00:00'), (44, 44, '2026-06-05 13:00:00'), (45, 45, '2026-06-05 14:00:00'),
(46, 46, '2026-06-05 15:00:00'), (47, 47, '2026-06-05 16:00:00'), (48, 48, '2026-06-05 17:00:00'), (49, 49, '2026-06-05 18:00:00'), (50, 50, '2026-06-05 19:00:00');

