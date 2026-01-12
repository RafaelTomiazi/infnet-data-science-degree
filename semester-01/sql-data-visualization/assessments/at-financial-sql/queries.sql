-- Assessment (AT): SQL & Data Visualization
-- Student: Rafael Celestino Tomiazi
-- Course: Data Visualization and SQL
-- Tool: Deepnote / SQLite

-- ==========================================
-- 0. SETUP (Schema & Data)
-- ==========================================
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    Cod_Cliente varchar(10),
    Nome_Cliente varchar(50),
    Idade_Cliente int,
    UF_Cliente varchar(2)
);

-- Insert sample data (based on your PDF)
INSERT INTO Cliente VALUES ('001', 'Matilde Braga', 45, 'AM');
INSERT INTO Cliente VALUES ('002', 'Alvares Rodrigues', 22, 'AM');
INSERT INTO Cliente VALUES ('003', 'Augusta Nunes', 33, 'PA');
INSERT INTO Cliente VALUES ('004', 'Igor Timóteo', 36, 'PA');
INSERT INTO Cliente VALUES ('005', 'Silvio Azevedo', 32, 'PA');
INSERT INTO Cliente VALUES ('006', 'Ingrid Costa', 45, 'RO');
INSERT INTO Cliente VALUES ('007', 'Taina Figueiredo', 52, 'AC');
INSERT INTO Cliente VALUES ('008', 'Rafael Lima', 31, 'AC');
INSERT INTO Cliente VALUES ('009', 'Tania Aguiar', 29, 'AC');
INSERT INTO Cliente VALUES ('010', 'Odir Antunes', 26, 'AC');

-- ==========================================
-- 🔍 QUERIES (AT 1 - AT 20)
-- ==========================================

-- AT 1: Mostrar duas colunas da tabela Cliente
SELECT Nome_Cliente, UF_Cliente FROM Cliente;

-- AT 2: Duas colunas com operador >=
SELECT Nome_Cliente, Idade_Cliente FROM Cliente WHERE Idade_Cliente >= 30;

-- AT 3: Três colunas com operador =
SELECT Cod_Cliente, Nome_Cliente, UF_Cliente FROM Cliente WHERE UF_Cliente = 'PA';

-- AT 4: Três colunas com operador IN
SELECT Cod_Cliente, Nome_Cliente, UF_Cliente FROM Cliente WHERE UF_Cliente IN ('AM', 'AC');

-- AT 5: Todas as colunas com operador NOT BETWEEN
SELECT * FROM Cliente WHERE Idade_Cliente NOT BETWEEN 30 AND 40;

-- AT 6: Todas as colunas com operadores > AND =
SELECT * FROM Cliente WHERE Idade_Cliente > 30 AND UF_Cliente = 'PA';

-- AT 7: Duas colunas com operadores = AND !=
SELECT Nome_Cliente, UF_Cliente FROM Cliente WHERE UF_Cliente = 'AM' AND Idade_Cliente != 25;

-- AT 8: Duas colunas com operadores = OR BETWEEN
SELECT Nome_Cliente, Idade_Cliente FROM Cliente WHERE UF_Cliente = 'RO' OR Idade_Cliente BETWEEN 20 AND 30;

-- AT 9: Três colunas ordenadas por 2 colunas (UF ASC, Idade DESC)
SELECT Cod_Cliente, Nome_Cliente, Idade_Cliente 
FROM Cliente 
ORDER BY UF_Cliente ASC, Idade_Cliente DESC;

-- AT 10: Count em uma coluna
SELECT COUNT(Cod_Cliente) AS Total_Clientes FROM Cliente;

-- AT 11: Sum em uma coluna
SELECT SUM(Idade_Cliente) AS Soma_Idades FROM Cliente;

-- AT 12: Agrupamento (Group By) com função MIN
SELECT UF_Cliente, MIN(Idade_Cliente) AS Menor_Idade 
FROM Cliente 
GROUP BY UF_Cliente;

-- AT 13: Agrupamento (Group By) com função AVG
SELECT UF_Cliente, AVG(Idade_Cliente) AS Media_Idade 
FROM Cliente 
GROUP BY UF_Cliente;

-- AT 14: Distinct em duas colunas
SELECT DISTINCT Nome_Cliente, UF_Cliente FROM Cliente;

-- AT 15: Distinct ordenado
SELECT DISTINCT UF_Cliente FROM Cliente ORDER BY UF_Cliente;

-- AT 16: Distinct com filtro
SELECT DISTINCT UF_Cliente FROM Cliente WHERE Idade_Cliente > 20;

-- AT 17: Agrupamento com HAVING COUNT < X
SELECT UF_Cliente, COUNT(*) AS Total 
FROM Cliente 
GROUP BY UF_Cliente 
HAVING COUNT(*) < 3;

-- AT 18: Agrupamento com HAVING MIN <= X
SELECT UF_Cliente, MIN(Idade_Cliente) AS Menor_Idade 
FROM Cliente 
GROUP BY UF_Cliente 
HAVING MIN(Idade_Cliente) <= 30;

-- AT 19: Agrupamento com HAVING SUM >= X
SELECT UF_Cliente, SUM(Idade_Cliente) AS Soma_Idades 
FROM Cliente 
GROUP BY UF_Cliente 
HAVING SUM(Idade_Cliente) >= 100;

-- AT 20: Agrupamento com AVG e Ordenação
SELECT UF_Cliente, AVG(Idade_Cliente) AS Media_Idade 
FROM Cliente 
GROUP BY UF_Cliente 
ORDER BY Media_Idade DESC;