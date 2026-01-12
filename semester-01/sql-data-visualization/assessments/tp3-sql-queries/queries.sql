-- TP3: SQL Operators & Deepnote
-- Student: Rafael Celestino Tomiazi
-- Course: Data Visualization and SQL
-- Tool: Deepnote / SQLite

-- ==========================================
-- 0. SETUP (Criação da Tabela e Dados Iniciais)
-- ==========================================
DROP TABLE IF EXISTS Atrizes_Atores;

CREATE TABLE Atrizes_Atores (
   PrimeiroNome varchar(40), 
   SobreNome varchar(40),
   MesNascimento varchar(20),
   AnoNascimento int,
   Pais varchar(50)
);

INSERT INTO Atrizes_Atores VALUES ('Meryl','Streep','junho',1949,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Scarlett','Johansson','novembro',1984,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Jodie','Foster','novembro',1962,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Susan','Sarandon','outubro',1946,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Natalie','Portman','junho',1981,'Israel');
INSERT INTO Atrizes_Atores VALUES ('Jack','Nicholson','abril',1937,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Robert','De Niro','agosto',1943,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Al','Pacino','abril',1940,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Denzel','Washington','dezembro',1954,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Harrison','Ford','julho',1942,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Angelina','Jolie','junho',1975,'EUA');
INSERT INTO Atrizes_Atores VALUES ('Leonardo','DiCaprio','novembro',1974,'EUA');

-- ==========================================
-- 🥇 NÍVEL BRONZE
-- ==========================================

-- TP 3.1: Criar dois comandos de insert com suas atrizes e atores preferidos
INSERT INTO Atrizes_Atores VALUES ('Wagner', 'Moura', 'junho', 1976, 'Brasil');
INSERT INTO Atrizes_Atores VALUES ('Fernanda', 'Montenegro', 'outubro', 1929, 'Brasil');

-- TP 3.2a: Consulta que mostra todas as colunas
SELECT * FROM Atrizes_Atores;

-- TP 3.2b: Consulta que mostra duas colunas (PrimeiroNome, AnoNascimento)
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores;

-- TP 3.3a: Operador > (Nascidos após 1980)
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento > 1980;

-- TP 3.3b: Operador >= (Nascidos em ou após 1980)
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento >= 1980;

-- TP 3.4a: Operador < (Nascidos antes de 1950)
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento < 1950;

-- TP 3.4b: Operador <= (Nascidos em ou antes de 1950)
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento <= 1950;

-- TP 3.5a: Operador = (Apenas dos EUA)
SELECT PrimeiroNome, Pais FROM Atrizes_Atores WHERE Pais = 'EUA';

-- TP 3.5b: Operador != (Diferente de EUA)
SELECT PrimeiroNome, Pais FROM Atrizes_Atores WHERE Pais != 'EUA';

-- TP 3.6a: Operador AND (Nascidos em 1984 E dos EUA)
SELECT PrimeiroNome, AnoNascimento, Pais FROM Atrizes_Atores WHERE AnoNascimento = 1984 AND Pais = 'EUA';

-- TP 3.6b: Operador OR (Nascidos em 1984 OU de Israel)
SELECT PrimeiroNome, AnoNascimento, Pais FROM Atrizes_Atores WHERE AnoNascimento = 1984 OR Pais = 'Israel';

-- TP 3.7a: Operador IN (Apenas EUA ou Israel)
SELECT PrimeiroNome, Pais FROM Atrizes_Atores WHERE Pais IN ('EUA', 'Israel');

-- TP 3.7b: Operador NOT IN (Que NÃO sejam dos EUA)
SELECT PrimeiroNome, Pais FROM Atrizes_Atores WHERE Pais NOT IN ('EUA');

-- TP 3.8a: Operador BETWEEN (Nascidos entre 1970 e 1980)
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento BETWEEN 1970 AND 1980;

-- TP 3.8b: Operador NOT BETWEEN (Não nascidos entre 1970 e 1980)
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento NOT BETWEEN 1970 AND 1980;

-- ==========================================
-- 🥈 NÍVEL PRATA
-- ==========================================

-- TP 3.9: Operadores > AND =
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento > 1970 AND Pais = 'EUA';

-- TP 3.10: Operadores >= AND !=
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento >= 1980 AND Pais != 'EUA';

-- TP 3.11: Operadores < AND !=
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento < 1950 AND Pais != 'Israel';

-- TP 3.12: Operadores <= AND =
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento <= 1975 AND Pais = 'EUA';

-- ==========================================
-- 🥉 NÍVEL OURO
-- ==========================================

-- TP 3.13: Operadores = OR IN
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE AnoNascimento = 1975 OR Pais IN ('Israel');

-- TP 3.14: Operadores != OR NOT IN
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE Pais != 'EUA' OR AnoNascimento NOT IN (1981);

-- TP 3.15: Operadores = OR BETWEEN
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE Pais = 'EUA' OR AnoNascimento BETWEEN 1980 AND 1990;

-- TP 3.16: Operadores != OR NOT BETWEEN
SELECT PrimeiroNome, AnoNascimento FROM Atrizes_Atores WHERE Pais != 'EUA' OR AnoNascimento NOT BETWEEN 1940 AND 1950;